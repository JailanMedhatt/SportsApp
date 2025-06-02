//
//  LeagueDetailsCollection.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 02/06/2025.
//

import UIKit

private let reuseIdentifier = "Cell"

class LeagueDetailsCollection: UICollectionViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(collectionView)

            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
            // Register your cells here
        collectionView.register(UpcomingMatchCell.self, forCellWithReuseIdentifier: "UpcomingMatchCell")
            collectionView.register(LatestEventCell.self, forCellWithReuseIdentifier: "LatestEventCell")
            collectionView.register(TeamCell.self, forCellWithReuseIdentifier: "TeamCell")
        
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderView.reuseIdentifier)


            
            collectionView.dataSource = self
            collectionView.delegate = self
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0:
                return self.createUpcomingMatchesSection()
            case 1:
                return self.createLatestEventsSection()
            case 2:
                return self.createTeamsSection()
            default:
                return nil
            }
        }
    }
    
    
    
    
    private func createUpcomingMatchesSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 0)
        
        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.94),
            heightDimension: .absolute(200)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 16)
        section.interGroupSpacing = 16
        
        // Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createLatestEventsSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(150)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(16)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
        section.interGroupSpacing = 0
        
        // Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createTeamsSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(120),
            heightDimension: .absolute(120)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
        section.interGroupSpacing = 0
        
        // Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    
    
//    func createUpcomingMatchesSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
//                                              heightDimension: .fractionalHeight(1.0))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                               heightDimension: .estimated(180))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
//                                                       subitems: [item])
//        group.interItemSpacing = .fixed(10)
//
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .groupPaging
//        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16)
//        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
//            items.forEach { item in
//                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
//                let minScale: CGFloat = 0.8
//                let maxScale: CGFloat = 1.0
//                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
//                item.transform = CGAffineTransform(scaleX: scale, y: scale)
//            }
//        }
//
//        return section
//    }
//    
//    func createLatestEventsSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                              heightDimension: .estimated(100))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                               heightDimension: .estimated(100))
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
//                                                     subitems: [item])
//
//        let section = NSCollectionLayoutSection(group: group)
//        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16)
//        section.interGroupSpacing = 10
//
//        return section
//    }
//    
//    func createTeamsSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(80),
//                                              heightDimension: .absolute(100))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300),
//                                               heightDimension: .absolute(100))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
//                                                       subitems: [item])
//        group.interItemSpacing = .fixed(12)
//
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
//        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 20, trailing: 16)
//
//        return section
//    }
    
    
    
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 5 //upcomingMatches.count
        case 1: return 10//latestEvents.count
        case 2: return 10 //teams.count
        default: return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingMatchCell", for: indexPath) as! UpcomingMatchCell
            
         //   let match = upcomingMatches[indexPath.item]
            
//                    cell.homeTeamLabel.text = "liverpool"//match.homeTeam
//                    cell.awayTeamLabel.text = match.awayTeam
//                    cell.homeTeamImage.image = UIImage(named: match.homeImageName)
//                    cell.awayTeamImage.image = UIImage(named: match.awayImageName)
            
            cell.configure(with: "liverpool")
            
            
            
            // configure cell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestEventCell", for: indexPath) as! LatestEventCell
            // configure cell
            
            
            cell.configure(with: "liverpool")
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamCell
            // configure cell
            cell.configure(with: "liverpool nknk")
            
            return cell
        default:
            fatalError("Unknown section")
        }
    }
    
    
    
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! HeaderView
//            switch indexPath.section {
//            case 0: header.titleLabel.text = "Upcoming Matches"
//            case 1: header.titleLabel.text = "Latest Events"
//            case 2: header.titleLabel.text = "Teams"
//            default: header.titleLabel.text = ""
//            }
//            return header
//        }
//        return UICollectionReusableView()
//    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            fatalError("Unsupported supplementary view kind")
        }

        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderView.reuseIdentifier,
            for: indexPath
        ) as! HeaderView
        
        switch indexPath.section {
        case 0:
            header.titleLabel.text = "Upcoming Matches"
        case 1:
            header.titleLabel.text = "Latest Events"
        case 2:
            header.titleLabel.text = "Teams"
        default:
            header.titleLabel.text = ""
        }

        return header
    }







    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//    
//        // Configure the cell
//    
//        return cell
//    }

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



/*class LeagueDetailsCollection: UICollectionViewController {
    
    enum Section: Int, CaseIterable {
        case upcomingMatches
        case latestMatches
        case teams
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>!
    
    // Sample data
    private var upcomingMatches: [Match] = [
        Match(homeTeam: "Betis", awayTeam: "Chelsea", date: "2025-05-28", time: "21:00", score: nil, isUpcoming: true),
        Match(homeTeam: "Betis", awayTeam: "Chelsea", date: "2025-05-28", time: "21:00", score: nil, isUpcoming: true),
        Match(homeTeam: "Betis", awayTeam: "Chelsea", date: "2025-05-28", time: "21:00", score: nil, isUpcoming: true)
    ]
    
    private var latestMatches: [Match] = [
        Match(homeTeam: "Florentina", awayTeam: "Real Betis", date: "2025-05-08", time: "21:00", score: "2 - 2", isUpcoming: false),
        Match(homeTeam: "Djurgården", awayTeam: "Florentina", date: "2025-05-08", time: "21:00", score: "1 - 0", isUpcoming: false),
        Match(homeTeam: "Florentina", awayTeam: "Djurgården", date: "2025-05-01", time: "21:00", score: "2 - 1", isUpcoming: false)
    ]
    
    private var teams: [Team] = [
        Team(name: "Porto", logo: "porto"),
        Team(name: "Olympiakos", logo: "olympiakos"),
        Team(name: "Ajax", logo: "ajax"),
        Team(name: "Midtiyiland", logo: "midtiyiland")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configureDataSource()
        applyInitialSnapshots()
    }
    
    private func setupCollectionView() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.backgroundColor = .systemGroupedBackground
        
        // Register cells
        collectionView.register(UpcomingMatchCell.self, forCellWithReuseIdentifier: UpcomingMatchCell.reuseIdentifier)
        collectionView.register(LatestMatchCell.self, forCellWithReuseIdentifier: LatestMatchCell.reuseIdentifier)
        collectionView.register(TeamCell.self, forCellWithReuseIdentifier: TeamCell.reuseIdentifier)
        
        // Register section headers
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.reuseIdentifier)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let section = Section(rawValue: sectionIndex) else { return nil }
            
            switch section {
            case .upcomingMatches:
                return self.createUpcomingMatchesSection()
            case .latestMatches:
                return self.createLatestMatchesSection()
            case .teams:
                return self.createTeamsSection()
            }
        }
        
        return layout
    }
    
    private func createUpcomingMatchesSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.85),
            heightDimension: .absolute(120)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 24, trailing: 16)
        section.interGroupSpacing = 16
        
        // Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createLatestMatchesSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(120)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(16)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0)
        section.interGroupSpacing = 16
        
        // Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createTeamsSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(120),
            heightDimension: .absolute(120)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16)
        section.interGroupSpacing = 16
        
        // Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectionView) {
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            
            guard let section = Section(rawValue: indexPath.section) else { return nil }
            
            switch section {
            case .upcomingMatches:
                guard let match = item as? Match else { return nil }
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: UpcomingMatchCell.reuseIdentifier,
                    for: indexPath) as! UpcomingMatchCell
                cell.configure(with: match)
                return cell
                
            case .latestMatches:
                guard let match = item as? Match else { return nil }
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: LatestMatchCell.reuseIdentifier,
                    for: indexPath) as! LatestMatchCell
                cell.configure(with: match)
                return cell
                
            case .teams:
                guard let team = item as? Team else { return nil }
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: TeamCell.reuseIdentifier,
                    for: indexPath) as! TeamCell
                cell.configure(with: team)
                return cell
            }
        }
        
        // Configure supplementary views (headers)
        dataSource.supplementaryViewProvider = { [weak self] (collectionView, kind, indexPath) in
            guard let self = self, kind == UICollectionView.elementKindSectionHeader else { return nil }
            
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderView.reuseIdentifier,
                for: indexPath) as! SectionHeaderView
            
            guard let section = Section(rawValue: indexPath.section) else { return view }
            
            switch section {
            case .upcomingMatches:
                view.titleLabel.text = "Upcoming Matches"
            case .latestMatches:
                view.titleLabel.text = "Latest Matches"
            case .teams:
                view.titleLabel.text = "Teams"
            }
            
            return view
        }
    }
    
        private func applyInitialSnapshots() {
            var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
            snapshot.appendSections(Section.allCases)
    
            // Upcoming matches
            snapshot.appendItems(upcomingMatches, toSection: .upcomingMatches)
    
            // Latest matches
            snapshot.appendItems(latestMatches, toSection: .latestMatches)
    
            // Teams
            snapshot.appendItems(teams, toSection: .teams)
    
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }
    
    // Section Header View
    class SectionHeaderView: UICollectionReusableView {
        static let reuseIdentifier = "SectionHeaderView"
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupViews() {
            addSubview(titleLabel)
            
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
        }
    }*/





extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}


//import UIKit

class HeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "HeaderView"

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

