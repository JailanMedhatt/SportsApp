//
//  LeagueTableViewController.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 31/05/2025.
//

import UIKit
import Kingfisher

class LeagueTableViewController: UITableViewController, LeagueProtocol {
    var indicator : UIActivityIndicatorView?
    var leagues : [LeagueDataModel] = []
    var presenter : LeaguePresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appBar = UIView()
        appBar.backgroundColor = UIColor(hex: "#337435")
        appBar.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 64)
        appBar.layer.cornerRadius = 42
        appBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        appBar.layer.masksToBounds = true

        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = "Leagues"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        appBar.addSubview(titleLabel)

        // Back button
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .white
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        appBar.addSubview(backButton)

        // Auto Layout for title and button
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: appBar.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: appBar.bottomAnchor, constant: -12),
            
            backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: appBar.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 28),
            backButton.heightAnchor.constraint(equalToConstant: 28)
        ])

        // Set as header
        tableView.tableHeaderView = appBar

        presenter.fetchLeagues()
        indicator = UIActivityIndicatorView(style: .large)
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        indicator?.startAnimating()
        tableView.separatorStyle = .none
        let nib = UINib(nibName: "LeagueTableViewCell", bundle: nil)  /// bundle  /// name of the cell class
        tableView.register(nib, forCellReuseIdentifier: "LeagueCell")
      //  NetworkManager.fetchLeagues(sport: "football")
       // self.title = "Leagues"
        
//        let titleLabel = UILabel()
//          titleLabel.text = "Leagues"
//          titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
//          titleLabel.textAlignment = .center
//          titleLabel.backgroundColor = .systemGroupedBackground
//          titleLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 60)
//
//          tableView.tableHeaderView = titleLabel
        
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Table view data source
    func getLeagues(leagues: [LeagueDataModel]?) {
        indicator?.stopAnimating()
        self.leagues = leagues ?? []
        print(leagues?.count)
        self.tableView.reloadData()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leagues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath)
        as! LeagueTableViewCell
        cell.leagueImage.kf.setImage(with: URL(string: leagues[indexPath.item].league_logo ?? "")  ,placeholder: UIImage(named: "f"))
        cell.leagueLabel.text = leagues[indexPath.row].league_name
        var isLiked = presenter.isLeagueinfav(leagueKey: leagues[indexPath.row].league_key!)
        if isLiked {
            cell.isLiked = true
        }
        else{cell.isLiked = false
        }
        cell.closure = { [weak self] in
            
            var league = self?.leagues[indexPath.row] ?? LeagueDataModel(league_key: 0, league_name: "", league_logo: "", sport: "")
            league.sport = self?.presenter.sport
            if(!isLiked){
                self?.presenter.addLeagueToFavorite(league: league)
                cell.isLiked.toggle()
                cell.updateHeartIcon()
                self?.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            else {
                var alertDialoug = UIAlertController(title: "Delete", message: "Are you sure you want to delete this league from your favorites?", preferredStyle: .alert)
                var action1 = UIAlertAction(title: "Yes", style: .default) { (_) in
                    self?.presenter.deleteLeagueToFavorite(leagueKey: league.league_key!)
                    cell.isLiked.toggle()
                    cell.updateHeartIcon()
                    self?.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
                var action2 = UIAlertAction(title: "No", style: .default)
                alertDialoug.addAction(action1)
                alertDialoug.addAction(action2)
                self?.present(alertDialoug, animated: true)
               
            }
          //  self?.tableView.reloadData()
           
        }
        

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
