//
//  TeamViewController.swift
//  SportsApp
//
//  Created by Jailan Medhat on 01/06/2025.
//

import UIKit

private let reuseIdentifier = "Cell"

class TeamViewController: UICollectionViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
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


    func teamSection()-> NSCollectionLayoutSection {
         let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
         let groupSize = NSCollectionLayoutSize(widthDimension:        .fractionalWidth(0.7), heightDimension: .absolute(180))
         let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
             , bottom: 0, trailing: 15)
         let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 64, leading: 86
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
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 8
            , bottom: 16, trailing: 15)
            
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
            return 10
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell", for: indexPath) as! PlayerCollectionViewCell
           // cell.img.image = UIImage(named: images[indexPath.item])
            cell.name.text = "John Doe"
            cell.position.text="Forward"
            cell.layer.borderWidth = 2
            cell.layer.borderColor =  UIColor(hex: "#337435").cgColor
//               cell.layer.cornerRadius = 8
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "coachCell", for: indexPath) as! CoachCollectionViewCell
          //  cell.img.image = UIImage(named: iconItems[indexPath.item].img)
            cell.name.text="Alba Doeeee"
            cell.myLabel.textColor = UIColor(hex: "#337435")
            return cell
            
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamViewControllerCollectionViewCell
            cell.myTitle.text="Team Name"
        
            return cell
            
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamViewControllerCollectionViewCell
            cell.myTitle.text="Team Name"
        
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
