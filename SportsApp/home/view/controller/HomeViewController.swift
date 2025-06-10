//
//  HomeViewController.swift
//  SportsApp
//
//  Created by Jailan Medhat on 30/05/2025.
//

import UIKit

private let reuseIdentifier = "Cell"
import Reachability

class HomeViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    // var reachability: Reachability!
    let sports : [Sport] = [Sport(img: "fff", name: "Football"), Sport(img: "cc", name: "Cricket"),
                            Sport(img: "b", name: "Basketball"),
                            Sport(img: "t", name: "Tennis")]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
       // startObservingNetworkStatus()
//        do {
//            reachability = try Reachability()
//            try reachability.startNotifier()
//            
//        } catch {
//            
//        }
//        reachability.whenUnreachable = { [weak self] _ in
//            print("Not reachable")
////            self.isConnected = false
//           // reachabilityChanged()
//            
//            self?.presentNoConnectionAlert()
//            self?.restartReachabilityNotifier()
//        }
            view.backgroundColor = .white // Your main view background

           
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
            titleLabel.text = "Sports"
            titleLabel.textColor = .white
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            appBar.addSubview(titleLabel)
            
            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: appBar.centerXAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: appBar.bottomAnchor, constant: -12)
            ])
        


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 80, left: 12, bottom: 0, right: 12)
            layout.minimumInteritemSpacing = 8 // spacing between the two cells
            layout.minimumLineSpacing = 32 // spacing between rows
        }
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
//    private func restartReachabilityNotifier() {
//        do {
//            reachability.stopNotifier()
//            try reachability.startNotifier()
//        } catch {
//            print("Failed to restart Reachability notifier")
//        }
//    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! CollectionViewCell
        cell.myTitle.text =  sports[indexPath.item].name
        cell.img.image = UIImage(named: sports[indexPath.item].img)
    
        // Configure the cell
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width)/2-20, height: 320)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       if NetworkMonitor.shared.isConnected ?? true {
            let sb = UIStoryboard(name: "Core", bundle: nil)
        
            if let vc = sb.instantiateViewController(withIdentifier: "Leagues") as? LeagueTableViewController {
                let presenter = LeaguePresenter(ref:  vc, sport: sports[indexPath.item].name)
                vc.presenter = presenter
                navigationController?.pushViewController(vc, animated: true)
            }
}
        else {
            presentNoConnectionAlert()
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

