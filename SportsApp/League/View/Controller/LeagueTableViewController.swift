//
//  LeagueTableViewController.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 31/05/2025.
//

import UIKit
import Kingfisher

class LeagueTableViewController: UITableViewController, LeagueProtocol , UISearchResultsUpdating{
  
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredLeagues : [LeagueDataModel] = []
    
    var isSearching: Bool {
        return !(searchController.searchBar.text?.isEmpty ?? true)
    }
    
    
    
    var indicator : UIActivityIndicatorView?
    var leagues : [LeagueDataModel] = []
    var presenter : LeaguePresenterProtocol!
   
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       self.navigationController?.setNavigationBarHidden(false, animated: true)
       let appearance = UINavigationBarAppearance()
          appearance.configureWithOpaqueBackground()
       appearance.titleTextAttributes = [.foregroundColor: UIColor(hex: "#337435")]
       appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(hex: "#337435")]
          navigationController?.navigationBar.standardAppearance = appearance
          navigationController?.navigationBar.scrollEdgeAppearance = appearance
      
       navigationController?.navigationBar.tintColor = UIColor(hex: "#337435")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
      
        self.title = "\(presenter.sport ?? "") Leagues"
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
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
       searchController.obscuresBackgroundDuringPresentation = false
       //searchController.automaticallyShowsSearchResultsController = true
        searchController.searchBar.placeholder = "Search Leagues"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        filteredLeagues = leagues.filter { league in
            return league.league_name?.lowercased().contains(searchText) ?? false
        }

        tableView.reloadData()

               
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
        return isSearching ? filteredLeagues.count : leagues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath)
        as! LeagueTableViewCell
//        cell.leagueImage.kf.setImage(with: URL(string: leagues[indexPath.item].league_logo ?? "")  ,placeholder: UIImage(named: "f"))
        let league = isSearching ? filteredLeagues[indexPath.item] : leagues[indexPath.item]
        
        cell.leagueImage.kf.setImage(with: URL(string: league.league_logo ?? "")  ,placeholder: UIImage(named: "league"))
       // cell.leagueLabel.text = leagues[indexPath.row].league_name
        cell.leagueLabel.text = league.league_name
        let isLiked = presenter.isLeagueinfav(leagueKey: league.league_key!)
        cell.isLiked = isLiked
        cell.closure = { [weak self] in
            
           // let league = self?.leagues[indexPath.row] ?? LeagueDataModel(league_key: 0, league_name: "", league_logo: "", sport: "")
            league.sport = self?.presenter.sport
            if(!isLiked){
                self?.presenter.addLeagueToFavorite(league: league)
                cell.isLiked.toggle()
                cell.updateHeartIcon()
                self?.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            else {
                let alertDialoug = UIAlertController(title: "Delete", message: "Are you sure you want to delete this league from your favorites?", preferredStyle: .alert)
                let action1 = UIAlertAction(title: "Yes", style: .default) { (_) in
                    self?.presenter.deleteLeagueToFavorite(leagueKey: league.league_key!)
                    cell.isLiked.toggle()
                    cell.updateHeartIcon()
                    self?.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
                let action2 = UIAlertAction(title: "No", style: .default)
                alertDialoug.addAction(action1)
                alertDialoug.addAction(action2)
                self?.present(alertDialoug, animated: true)
               
            }
          //  self?.tableView.reloadData()
           
        }
        

        // Configure the cell...

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if NetworkMonitor.shared.isConnected ?? true{
           // let selectedLeague = leagues[indexPath.row]
            let selectedLeague = isSearching ? filteredLeagues[indexPath.row] : leagues[indexPath.row]
            selectedLeague.sport = presenter?.sport?.lowercased() ?? ""
            
            let sb = UIStoryboard(name: "Core", bundle: nil)
        
            if let vc = sb.instantiateViewController(withIdentifier: "LeagueDetails") as? LeagueDetailsCollection {
                let presenter = LeagueDetailsPresenter(ref: vc,league: selectedLeague)
                vc.presenter = presenter
                navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            presentNoConnectionAlert()
        }
    
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
