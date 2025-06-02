//
//  UpcomingMatchCell.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 02/06/2025.
//

//import UIKit
//
//class UpcomingMatchCell: UICollectionViewCell {
//    
//  
//
//        let homeTeamImage = UIImageView()
//        let awayTeamImage = UIImageView()
//        let homeTeamLabel = UILabel()
//        let awayTeamLabel = UILabel()
//        let dateLabel = UILabel()
//        let timeLabel = UILabel()
//
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            setupViews()
//            setupConstraints()
//        }
//
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//        func setupViews() {
//            [homeTeamImage, awayTeamImage, homeTeamLabel, awayTeamLabel, dateLabel, timeLabel].forEach {
//                $0.translatesAutoresizingMaskIntoConstraints = false
//                contentView.addSubview($0)
//            }
//
//            homeTeamImage.contentMode = .scaleAspectFit
//            awayTeamImage.contentMode = .scaleAspectFit
//            homeTeamLabel.font = .systemFont(ofSize: 14, weight: .medium)
//            awayTeamLabel.font = .systemFont(ofSize: 14, weight: .medium)
//            homeTeamLabel.textAlignment = .center
//            awayTeamLabel.textAlignment = .center
//
//            dateLabel.font = .systemFont(ofSize: 13)
//            dateLabel.textAlignment = .center
//            dateLabel.textColor = .darkGray
//
//            timeLabel.font = .systemFont(ofSize: 16, weight: .bold)
//            timeLabel.textAlignment = .center
//        }
//
//        func setupConstraints() {
//            NSLayoutConstraint.activate([
//                homeTeamImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
//                homeTeamImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//                homeTeamImage.widthAnchor.constraint(equalToConstant: 50),
//                homeTeamImage.heightAnchor.constraint(equalToConstant: 50),
//
//                awayTeamImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
//                awayTeamImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//                awayTeamImage.widthAnchor.constraint(equalToConstant: 50),
//                awayTeamImage.heightAnchor.constraint(equalToConstant: 50),
//
//                homeTeamLabel.topAnchor.constraint(equalTo: homeTeamImage.bottomAnchor, constant: 8),
//                homeTeamLabel.centerXAnchor.constraint(equalTo: homeTeamImage.centerXAnchor),
//
//                awayTeamLabel.topAnchor.constraint(equalTo: awayTeamImage.bottomAnchor, constant: 8),
//                awayTeamLabel.centerXAnchor.constraint(equalTo: awayTeamImage.centerXAnchor),
//
//                timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//                timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
//
//                dateLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 4),
//                dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
//            ])
//        }
//    
//    func configure(with title: String) {
//        homeTeamImage.image = UIImage(systemName: "f")
//        awayTeamImage.image = UIImage(systemName: "f")
//        homeTeamLabel.text = title
//        awayTeamLabel.text = title
//        dateLabel.text = "22-5-2021"
//        timeLabel.text = "12:00 PM"
//    }
//
//    
//
//}


import UIKit

/*class UpcomingMatchCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
//        let gradient = CAGradientLayer()
//        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
//        gradient.startPoint = CGPoint(x: 0, y: 0)
//        gradient.endPoint = CGPoint(x: 1, y: 1)
//        view.layer.insertSublayer(gradient, at: 0)
//        view.layoutSubviews()
//        gradient.frame = view.bounds
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemGreen.withAlphaComponent(0.6).cgColor,
                           UIColor.systemMint.withAlphaComponent(0.6).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.frame = CGRect(x: 0, y: 0, width: 350, height: 150)
        view.layer.insertSublayer(gradient, at: 0)
        return view
    }()
    
    let homeTeamImage = UIImageView()
    let awayTeamImage = UIImageView()
    let homeTeamLabel = UILabel()
    let awayTeamLabel = UILabel()
    let vsImageView = UIImageView()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        
        homeTeamImage.contentMode = .scaleAspectFit
        awayTeamImage.contentMode = .scaleAspectFit
        vsImageView.contentMode = .scaleAspectFit
        vsImageView.image = UIImage(named: "vs") // You must add a "vs" image to assets
        
        homeTeamLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        homeTeamLabel.textColor = .white
        homeTeamLabel.textAlignment = .center
        
        awayTeamLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        awayTeamLabel.textColor = .white
        awayTeamLabel.textAlignment = .center
        
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .center
        
        timeLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center

        contentView.addSubview(containerView)
        [homeTeamImage, awayTeamImage, homeTeamLabel, awayTeamLabel, vsImageView, dateLabel, timeLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            homeTeamImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            homeTeamImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            homeTeamImage.widthAnchor.constraint(equalToConstant: 48),
            homeTeamImage.heightAnchor.constraint(equalToConstant: 48),
            
            awayTeamImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            awayTeamImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            awayTeamImage.widthAnchor.constraint(equalToConstant: 48),
            awayTeamImage.heightAnchor.constraint(equalToConstant: 48),
            
            vsImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            vsImageView.centerYAnchor.constraint(equalTo: homeTeamImage.centerYAnchor),
            vsImageView.widthAnchor.constraint(equalToConstant: 30),
            vsImageView.heightAnchor.constraint(equalToConstant: 30),
            
            homeTeamLabel.topAnchor.constraint(equalTo: homeTeamImage.bottomAnchor, constant: 8),
            homeTeamLabel.centerXAnchor.constraint(equalTo: homeTeamImage.centerXAnchor),
            
            awayTeamLabel.topAnchor.constraint(equalTo: awayTeamImage.bottomAnchor, constant: 8),
            awayTeamLabel.centerXAnchor.constraint(equalTo: awayTeamImage.centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: vsImageView.bottomAnchor, constant: 8),
            dateLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            timeLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            timeLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with title: String) {
        homeTeamImage.image = UIImage(named:"f")
        awayTeamImage.image = UIImage(named: "f")
        homeTeamLabel.text = "title"
        awayTeamLabel.text = "title"
        vsImageView.image = UIImage(named: "b")
        dateLabel.text = "22-5-2021"
        timeLabel.text = "12:00 PM"
    }
}*/


//import UIKit
//
//class UpcomingMatchCell: UICollectionViewCell {
//    
//    // MARK: - UI Elements
//    
//    let containerView: UIView = {
//        let view = UIView()
//        view.layer.cornerRadius = 16
//        view.clipsToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        
//        // Gradient background
//        let gradient = CAGradientLayer()
//        gradient.colors = [UIColor.systemBlue.withAlphaComponent(0.6).cgColor,
//                           UIColor.systemPurple.withAlphaComponent(0.6).cgColor]
//        gradient.startPoint = CGPoint(x: 0, y: 0.5)
//        gradient.endPoint = CGPoint(x: 1, y: 0.5)
//        gradient.frame = CGRect(x: 0, y: 0, width: 350, height: 150)
//        view.layer.insertSublayer(gradient, at: 0)
//        
//        return view
//    }()
//    
//    let homeTeamImage = UIImageView()
//    let awayTeamImage = UIImageView()
//    
//    let homeTeamLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.font = UIFont.boldSystemFont(ofSize: 14)
//        label.textColor = .white
//        return label
//    }()
//    
//    let awayTeamLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.font = UIFont.boldSystemFont(ofSize: 14)
//        label.textColor = .white
//        return label
//    }()
//    
//    let vsImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "vs") // Add your VS image to assets
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//    
//    let dateLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 14)
//        return label
//    }()
//    
//    let timeLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 14)
//        return label
//    }()
//
//    // MARK: - Init
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: - Layout
//    
//    private func setupUI() {
//        contentView.addSubview(containerView)
//        [homeTeamImage, awayTeamImage, homeTeamLabel, awayTeamLabel, vsImageView, dateLabel, timeLabel].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            containerView.addSubview($0)
//        }
//        
//        NSLayoutConstraint.activate([
//            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//
//            homeTeamImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
//            homeTeamImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
//            homeTeamImage.widthAnchor.constraint(equalToConstant: 50),
//            homeTeamImage.heightAnchor.constraint(equalToConstant: 50),
//
//            awayTeamImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
//            awayTeamImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
//            awayTeamImage.widthAnchor.constraint(equalToConstant: 50),
//            awayTeamImage.heightAnchor.constraint(equalToConstant: 50),
//
//            homeTeamLabel.topAnchor.constraint(equalTo: homeTeamImage.bottomAnchor, constant: 8),
//            homeTeamLabel.centerXAnchor.constraint(equalTo: homeTeamImage.centerXAnchor),
//
//            awayTeamLabel.topAnchor.constraint(equalTo: awayTeamImage.bottomAnchor, constant: 8),
//            awayTeamLabel.centerXAnchor.constraint(equalTo: awayTeamImage.centerXAnchor),
//
//            vsImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            vsImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
//            vsImageView.widthAnchor.constraint(equalToConstant: 30),
//            vsImageView.heightAnchor.constraint(equalToConstant: 30),
//
//            dateLabel.topAnchor.constraint(equalTo: vsImageView.bottomAnchor, constant: 8),
//            dateLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//
//            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
//            timeLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
//        ])
//    }
//    
//    
//    func configure(with title: String) {
//            homeTeamImage.image = UIImage(named:"f")
//            awayTeamImage.image = UIImage(named: "f")
//            homeTeamLabel.text = "title"
//            awayTeamLabel.text = "title"
//            vsImageView.image = UIImage(named: "b")
//            dateLabel.text = "22-5-2021"
//            timeLabel.text = "12:00 PM"
//        }
//}
//


/*class UpcomingMatchCell: UICollectionViewCell {
    static let reuseIdentifier = "UpcomingMatchCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#379C67").cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let awayTeamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
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
        contentView.addSubview(containerView)
        containerView.addSubview(vsLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(homeTeamLabel)
        containerView.addSubview(awayTeamLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            timeLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            vsLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            vsLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            homeTeamLabel.trailingAnchor.constraint(equalTo: vsLabel.leadingAnchor, constant: -16),
            homeTeamLabel.centerYAnchor.constraint(equalTo: vsLabel.centerYAnchor),
            homeTeamLabel.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 12),
            
            awayTeamLabel.leadingAnchor.constraint(equalTo: vsLabel.trailingAnchor, constant: 16),
            awayTeamLabel.centerYAnchor.constraint(equalTo: vsLabel.centerYAnchor),
            awayTeamLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -12)
        ])
    }
    
    func configure(with match: Match) {
        homeTeamLabel.text = match.homeTeam
        awayTeamLabel.text = match.awayTeam
        dateLabel.text = match.date
        timeLabel.text = match.time
    }
}*/


class UpcomingMatchCell: UICollectionViewCell {
    static let reuseIdentifier = "UpcomingMatchCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#379C67").cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let homeTeamStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let homeTeamLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
       // iv.layer.cornerRadius = iv.frame.size.width / 2
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 80).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return iv
    }()
    
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let awayTeamStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let awayTeamLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 80).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return iv
    }()
    
    private let awayTeamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 2
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
        contentView.addSubview(containerView)
        containerView.addSubview(dateLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(vsLabel)
        
        // Setup home team stack
        homeTeamStack.addArrangedSubview(homeTeamLogo)
        homeTeamStack.addArrangedSubview(homeTeamLabel)
        containerView.addSubview(homeTeamStack)
        
        // Setup away team stack
        awayTeamStack.addArrangedSubview(awayTeamLogo)
        awayTeamStack.addArrangedSubview(awayTeamLabel)
        containerView.addSubview(awayTeamStack)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            timeLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            
            vsLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 8),
            vsLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            homeTeamStack.trailingAnchor.constraint(equalTo: vsLabel.leadingAnchor, constant: -32),
            homeTeamStack.centerYAnchor.constraint(equalTo: vsLabel.centerYAnchor),
            homeTeamStack.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 12),
            
            
            awayTeamStack.leadingAnchor.constraint(equalTo: vsLabel.trailingAnchor, constant: 32),
            awayTeamStack.centerYAnchor.constraint(equalTo: vsLabel.centerYAnchor),
            awayTeamStack.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -12)
        ])
    }
    
//    func configure(with match: Match) {
//        homeTeamLabel.text = match.homeTeam
//        awayTeamLabel.text = match.awayTeam
//        dateLabel.text = match.date
//        timeLabel.text = match.time
//        
//        // Set team logos (replace with your image loading logic)
//        homeTeamLogo.image = UIImage(named: match.homeTeamLogo)
//        awayTeamLogo.image = UIImage(named: match.awayTeamLogo)
//    }
    
    func configure(with title: String) {
               // homeTeamImage.image = UIImage(named:"f")
                //awayTeamImage.image = UIImage(named: "f")
        homeTeamLogo.image = UIImage(named:"f")
        awayTeamLogo.image = UIImage(named: "f")
        
                homeTeamLabel.text = "title"
                awayTeamLabel.text = "title"
               // vsImageView.image = UIImage(named: "b")
                dateLabel.text = "22-5-2021"
                timeLabel.text = "12:00 PM"
            }
}

    
  
