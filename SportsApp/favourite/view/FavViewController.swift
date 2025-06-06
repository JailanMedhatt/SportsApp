//
//  FavViewController.swift
//  SportsApp
//
//  Created by Jailan Medhat on 03/06/2025.
//

import UIKit
import CoreData
import Lottie


class FavViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavouriteProtocol{
    @IBOutlet weak var tableView: UITableView!
    var emptyAnimationView: LottieAnimationView?

    var indicator : UIActivityIndicatorView?
    var presenter : FavouritePresenterProtocol!
    var leaguesArrays : [[LeagueDataModel]] = []
    var myHeaders : [String] = []
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
   
    func getLeagues(leagues: [[LeagueDataModel]]? , headers: [String]) {
        
        self.indicator?.stopAnimating()
     
        leaguesArrays = leagues ?? []
        myHeaders = headers
        if myHeaders.isEmpty
            {
            showEmptyAnimation()
        }
        else
        {
            hideEmptyAnimation()
        }


        self.tableView.reloadData()
    
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
     override func viewDidLoad() {
        super.viewDidLoad()
         startObservingNetworkStatus()
         loadAppBar()
         tableView.dataSource = self
         tableView.delegate = self
        presenter = FavPresenter(ref: self)
         indicator = UIActivityIndicatorView(style: .large)
         indicator?.center = self.view.center
         indicator?.startAnimating()
         self.view.addSubview(indicator!)
        let nib = UINib(nibName: "LeagueTableViewCell", bundle: nil)  /// bundle  /// name of the cell class
        tableView.register(nib, forCellReuseIdentifier: "LeagueCell")
   
    }
   
    override func viewDidAppear(_ animated: Bool) {
       
    refreshTable()
       
        
        tableView.separatorStyle = .none
       
    }
    func refreshTable() {
       
        presenter.fetchLeagues()
        tableView.reloadData()
       
    }
    func reloadData() {
        tableView.reloadData()
        if myHeaders.isEmpty
            {
            showEmptyAnimation()
        }
       
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return myHeaders.count
    }
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section){
            case 0:
            return myHeaders[0]
        case 1:
            return myHeaders[1]
        case 2:
            return myHeaders[2]
        default:
            return myHeaders[3]
        }
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch (section){
            case 0:
            return leaguesArrays[0].count
        case 1:
            return leaguesArrays[1].count
        case 2:
            return leaguesArrays[2].count
        default:
            return leaguesArrays[3].count
        }
       
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath)
        as! LeagueTableViewCell
        cell.heartButton.isHidden = true
        cell.leagueLabel.text = leaguesArrays[indexPath.section][indexPath.row].league_name
        cell.leagueImage.kf.setImage(with: URL(string: leaguesArrays[indexPath.section][indexPath.row].league_logo ?? "")  ,placeholder: UIImage(named: "f"))

        return cell
    }


     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let alertDialoug = UIAlertController(title: "Delete", message: "Are you sure you want to delete this league from your favorites?", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Yes", style: .default) { (_) in
                self.presenter.deleteLeagueToFavorite(leagueKey: self.leaguesArrays[indexPath.section][indexPath.item].league_key!)
                self.leaguesArrays[indexPath.section].remove(at: indexPath.item)
                if self.leaguesArrays[indexPath.section].count == 0 {
                    self.myHeaders.remove(at: indexPath.section)
                    self.leaguesArrays.remove(at: indexPath.section)
                    
                }
                             
                self.reloadData()

            }
            let action2 = UIAlertAction(title: "No", style: .default)
            alertDialoug.addAction(action1)
            alertDialoug.addAction(action2)
            present(alertDialoug, animated: true)
          
            
        } else if editingStyle == .insert {
         
        }    
    }
    

    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let selectedLeague = leaguesArrays[indexPath.section][indexPath.row]
         print("\(selectedLeague.sport)" + "keeyy")
       if NetworkMonitor.shared.isConnected ?? true {
             
                 let sb = UIStoryboard(name: "Core", bundle: nil)
             
                 if let vc = sb.instantiateViewController(withIdentifier: "LeagueDetails") as? LeagueDetailsCollection {
                     let dpresenter = LeagueDetailsPresenter(ref: vc,league: selectedLeague)
                     vc.presenter = dpresenter
                     navigationController?.pushViewController(vc, animated: true)
                 }
         }
         else {
             presentNoConnectionAlert()
         }

   
    }
    func loadAppBar() {
        
         let appBar = UIView()
         appBar.backgroundColor =  UIColor(hex: "#337435")
         appBar.translatesAutoresizingMaskIntoConstraints = false
         appBar.layer.cornerRadius = 42
         appBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner] //
          appBar.layer.masksToBounds = true
         view.addSubview(appBar)

         NSLayoutConstraint.activate([
             appBar.topAnchor.constraint(equalTo: view.topAnchor),
             appBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             appBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             appBar.heightAnchor.constraint(equalToConstant: 105) // Or use view.safeAreaLayoutGuide
         ])
         
         // Title label
         let titleLabel = UILabel()
         titleLabel.text = "Favourite"
         titleLabel.textColor = .white
         titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         appBar.addSubview(titleLabel)
         
         NSLayoutConstraint.activate([
             titleLabel.centerXAnchor.constraint(equalTo: appBar.centerXAnchor),
             titleLabel.bottomAnchor.constraint(equalTo: appBar.bottomAnchor, constant: -12)
         ])
     
    }
    func showEmptyAnimation() {
        if emptyAnimationView == nil {
            emptyAnimationView = LottieAnimationView(name: "empty") // Put your animation JSON file name here (without .json)
            emptyAnimationView?.loopMode = .loop
            emptyAnimationView?.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(emptyAnimationView!)

            NSLayoutConstraint.activate([
                emptyAnimationView!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                emptyAnimationView!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                emptyAnimationView!.widthAnchor.constraint(equalToConstant: 150),
                emptyAnimationView!.heightAnchor.constraint(equalToConstant: 150)
            ])
        }
        emptyAnimationView?.isHidden = false
        emptyAnimationView?.play()
        tableView.isHidden = true
    }

    func hideEmptyAnimation() {
        emptyAnimationView?.stop()
        emptyAnimationView?.isHidden = true
        tableView.isHidden = false
    }


}
