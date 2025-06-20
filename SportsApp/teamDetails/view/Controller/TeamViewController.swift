//
//  TeamViewController.swift
//  SportsApp
//
//  Created by Jailan Medhat on 01/06/2025.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "Cell"

class TeamViewController: UICollectionViewController, TeamDeatilsProtocol {
 
    
    var indicator : UIActivityIndicatorView?
    var teamDetailsList : [TeamDetails]?
    var presenter : TeamDetailsPresenter!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }


    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        presenter.getTeamDetails()
        
        indicator = UIActivityIndicatorView(style: .large)
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        indicator?.startAnimating()
        
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
         
        navigationController?.navigationBar.tintColor = .white
         let titleLabel = UILabel()
         titleLabel.text = "Details"
         titleLabel.textColor = .white
         titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         appBar.addSubview(titleLabel)
         
         NSLayoutConstraint.activate([
             titleLabel.centerXAnchor.constraint(equalTo: appBar.centerXAnchor),
             titleLabel.bottomAnchor.constraint(equalTo: appBar.bottomAnchor, constant: -12)
         ])
        // Back button
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .white
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        appBar.addSubview(backButton)

        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: appBar.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 28),
            backButton.heightAnchor.constraint(equalToConstant: 28)
        ])

     

        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
                    switch sectionIndex {
                    case 0 :
                        return self.teamSection()
                    case 1:
                        return self.CoachSection()
                    case 2 :
                        return self.PlayerListSection()
                        //return .....NSCollectionLayoutSection
                    default:
                        return self.PlayerListSection()
                    }
                }
        collectionView.setCollectionViewLayout(layout, animated: true)
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

      

    }
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func setTeamDetails(teamDetailsArray: [TeamDetails]?) {
        indicator?.stopAnimating()
        teamDetailsList = teamDetailsArray
        
        collectionView.reloadData()
    
    }

    

    func teamSection()-> NSCollectionLayoutSection {
         let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension:        .fractionalWidth(1.0), heightDimension: .absolute(180))
         let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
             , bottom: 0, trailing: 0)
         let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 64, leading: 0
        , bottom: 0, trailing: 0)
         return section
    }
    func CoachSection()-> NSCollectionLayoutSection {
          let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
          , heightDimension: .fractionalHeight(1))
          let item = NSCollectionLayoutItem(layoutSize: itemSize)
          
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
        , heightDimension: .absolute(40))
          let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
          , subitems: [item])
          group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
          , bottom: 0, trailing: 15)
          
          let section = NSCollectionLayoutSection(group: group)
          section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
          , bottom: 10, trailing: 0)
      
          
          return section
      }
    func PlayerListSection()->NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
            , heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
            , heightDimension: .absolute(120))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
            , subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
            , bottom: 8, trailing: 0)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16
            , bottom: 16, trailing: 16)
            
            return section
        }
  

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch(section){
            case 0:
            return 1
        case 1:
            return 1
        default:
            return teamDetailsList?.first?.players?.count ?? 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       // if let teamDetails = teamDetailsList
        guard let teamDetails = teamDetailsList?.first else {
               // Return empty cells if no team details available
               return collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath)
           }
        
        
        switch indexPath.section {
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell", for: indexPath) as! PlayerCollectionViewCell
            
            print("this is imaaaaaage of \(teamDetails.players?[indexPath.item].playerName) : \(teamDetails.players?[indexPath.item].playerImage)" )
            
            
            cell.img.kf.setImage(with: URL(string: teamDetails.players?[indexPath.item].playerImage ?? "") , placeholder: UIImage(named: "player"))
            cell.name.text = teamDetails.players?[indexPath.item].playerName
            cell.position.text = teamDetails.players?[indexPath.item].playerType
            cell.layer.borderWidth = 2
            cell.layer.borderColor =  UIColor(hex: "#337435").cgColor
//               cell.layer.cornerRadius = 8
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "coachCell", for: indexPath) as! CoachCollectionViewCell
            cell.name.text = teamDetails.coaches?.first?.coachName ?? "unknown"
            cell.myLabel.textColor = UIColor(hex: "#337435")
            return cell
            
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamViewControllerCollectionViewCell
            cell.img.kf.setImage(with: URL(string: teamDetails.teamLogo ?? "") , placeholder: UIImage(named: "football"))
            cell.myTitle.text = teamDetails.teamName
        
            return cell
            
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamViewControllerCollectionViewCell
            cell.img.kf.setImage(with: URL(string: teamDetails.teamLogo ?? "") , placeholder: UIImage(named: "football"))
            cell.myTitle.text = teamDetails.teamName
        
            return cell
        }
    
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
