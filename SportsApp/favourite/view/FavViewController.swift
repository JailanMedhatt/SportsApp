//
//  FavViewController.swift
//  SportsApp
//
//  Created by Jailan Medhat on 03/06/2025.
//

import UIKit
import CoreData

class FavViewController: UITableViewController , FavouriteProtocol{
    var indicator : UIActivityIndicatorView?
    var presenter : FavPresenter!
    var leaguesArrays : [[LeagueDataModel]] = []
    var myHeaders : [String] = []
    func getLeagues(leagues: [[LeagueDataModel]]? , headers: [String]) {
        
        self.indicator?.stopAnimating()
     
        leaguesArrays = leagues ?? []
        myHeaders = headers


        self.tableView.reloadData()
    
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
     override func viewDidLoad() {
        super.viewDidLoad()
      
        presenter = FavPresenter(ref: self)
        indicator = UIActivityIndicatorView(style: .large)
        indicator?.center = self.view.center
        indicator?.startAnimating()
        let nib = UINib(nibName: "LeagueTableViewCell", bundle: nil)  /// bundle  /// name of the cell class
        tableView.register(nib, forCellReuseIdentifier: "LeagueCell")
   
    }
   
    override func viewDidAppear(_ animated: Bool) {
    refreshTable()
       
        self.view.addSubview(indicator!)
        tableView.separatorStyle = .none
       
    }
    func refreshTable() {
        
        presenter.fetchLeagues()
        tableView.reloadData()
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return myHeaders.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath)
        as! LeagueTableViewCell
        cell.heartButton.isHidden = true
      
        switch indexPath.section {
            case 0 :
            cell.leagueLabel.text = leaguesArrays[0][indexPath.row].league_name
            cell.leagueImage.kf.setImage(with: URL(string: leaguesArrays[0][indexPath.row].league_logo ?? "")  ,placeholder: UIImage(named: "f"))

            return cell
            case 1 :
            cell.leagueLabel.text = leaguesArrays[1][indexPath.row].league_name
            cell.leagueImage.kf.setImage(with: URL(string: leaguesArrays[1][indexPath.row].league_logo ?? "")  ,placeholder: UIImage(named: "f"))

          
            return cell
            case 2 :
            cell.leagueLabel.text = leaguesArrays[2][indexPath.row].league_name
            cell.leagueImage.kf.setImage(with: URL(string: leaguesArrays[2][indexPath.row].league_logo ?? "")  ,placeholder: UIImage(named: "f"))

         
            return cell
        default :
            cell.leagueLabel.text = leaguesArrays[3][indexPath.row].league_name
            cell.leagueImage.kf.setImage(with: URL(string: leaguesArrays[3][indexPath.row].league_logo ?? "")  ,placeholder: UIImage(named: "f"))

            return cell
        }
    }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let alertDialoug = UIAlertController(title: "Delete", message: "Are you sure you want to delete this league from your favorites?", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Yes", style: .default) { (_) in
                switch indexPath.section {
                    case 0:
                    self.presenter.deleteLeagueToFavorite(leagueKey: self.leaguesArrays[0][indexPath.item].league_key!)
                    self.leaguesArrays[0].remove(at: indexPath.item)
                    if self.leaguesArrays[0].count == 0 {
                        self.myHeaders.remove(at: 0)
                        self.leaguesArrays.remove(at: 0)
                        
                    }
                    break
                    case 1:
                    self.presenter.deleteLeagueToFavorite(leagueKey: self.leaguesArrays[1][indexPath.item].league_key!)
                        self.leaguesArrays[1].remove(at: indexPath.item)
                    if self.leaguesArrays[1].count == 0 {
                        self.myHeaders.remove(at: 1)
                        self.leaguesArrays.remove(at: 1)
                        
                    }
                    break
                    case 2:
                    self.presenter.deleteLeagueToFavorite(leagueKey: self.leaguesArrays[2][indexPath.item].league_key!)
                    self.leaguesArrays[2].remove(at: indexPath.item)
                    if self.leaguesArrays[2].count == 0 {
                        self.myHeaders.remove(at: 2)
                        self.leaguesArrays.remove(at: 2)
                        
                    }
                    break
                default:
                    self.presenter.deleteLeagueToFavorite(leagueKey: self.leaguesArrays[3][indexPath.item].league_key!)
                    self.leaguesArrays[3].remove(at: indexPath.item)
                    if self.leaguesArrays[3].count == 0 {
                        self.myHeaders.remove(at: 3)
                        self.leaguesArrays.remove(at: 3)
                        
                    }
                    break
                }
             
                self.tableView.reloadData()

            }
            let action2 = UIAlertAction(title: "No", style: .default)
            alertDialoug.addAction(action1)
            alertDialoug.addAction(action2)
            present(alertDialoug, animated: true)
          
            
        } else if editingStyle == .insert {
         
        }    
    }
    

 

}
