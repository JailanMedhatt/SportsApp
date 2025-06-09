//
//  UpcomingMatchCell.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 02/06/2025.
//

import UIKit


class UpcomingMatchCell: UICollectionViewCell {
    static let reuseIdentifier = "UpcomingMatchCell"
    
//    private let containerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(hex: "#379C67")
//        view.layer.cornerRadius = 12
//        view.layer.borderWidth = 1
//        
//        
//
//      //  view.layer.borderColor = UIColor(hex: "#379C67").cgColor
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOpacity = 0.1
//        view.layer.shadowOffset = CGSize(width: 0, height: 2)
//        view.layer.shadowRadius = 4
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    
    
    private let containerView: GradientContainerView = {
        let view = GradientContainerView()
//        view.configureGradient(
//            topColor: UIColor(hex: "#5CB484"), // Lighter green
//            bottomColor: UIColor(hex: "#379C67") // Your original color
//        )
//        view.configureGradient(
//            topColor: UIColor(hex: "#379C67").withAlphaComponent(0.8),
//            bottomColor: UIColor(hex: "#379C67")
//        )
        
        view.configureGradient(
            topColor: UIColor(hex: "#A3D9B1"), // Very light green
            bottomColor: UIColor(hex: "#337435") // Your original color
        )
        337435   /// 379C67
       
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let emptyStateLabel: UILabel = {
           let label = UILabel()
           label.text = "No Upcoming Matches"
           label.textAlignment = .center
           label.textColor = .darkGray
           label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
           label.isHidden = true
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
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
        contentView.addSubview(emptyStateLabel)
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
            
            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
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
            awayTeamStack.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -12),
            
            
            emptyStateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emptyStateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            emptyStateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emptyStateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
     
                  
        ])
    }
    
    func configure(event : Event?) {
        if let event = event{
            vsLabel.isHidden = false
            emptyStateLabel.isHidden = true
            homeTeamLogo.kf.setImage(with: URL(string: event.participant1Logo ?? "") , placeholder: UIImage(named: "f"))
            awayTeamLogo.kf.setImage(with: URL(string: event.participant2Logo ?? "") , placeholder: UIImage(named: "f"))
            homeTeamLabel.text = event.participant1Name
            awayTeamLabel.text = event.participant2Name
            dateLabel.text = event.eventDate
            timeLabel.text = event.eventTime
        }
        else {
            vsLabel.isHidden = true
            emptyStateLabel.isHidden = false
        }
       
    }
    
//    func configure(with title: String) {
//               // homeTeamImage.image = UIImage(named:"f")
//                //awayTeamImage.image = UIImage(named: "f")
//        homeTeamLogo.image = UIImage(named:"tt")
//        awayTeamLogo.image = UIImage(named: "fff")
//        
//                homeTeamLabel.text = "title"
//                awayTeamLabel.text = "title"
//               // vsImageView.image = UIImage(named: "b")
//                dateLabel.text = "22-5-2021"
//                timeLabel.text = "12:00 PM"
//            }
}



//class GradientView: UIView {
//    override class var layerClass: AnyClass {
//        return CAGradientLayer.self
//    }
//    
//    func configureGradient(topColor: UIColor, bottomColor: UIColor) {
//        guard let gradientLayer = self.layer as? CAGradientLayer else { return }
//        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
//    }
//}


class GradientContainerView: UIView {
    let contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Configure shadow on the container
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        backgroundColor = .clear
        
        // Configure content view (holds the gradient and content)
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureGradient(topColor: UIColor, bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = 12
        
        // Remove any existing gradient layer
        contentView.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        
        // Add new gradient layer at the bottom
        contentView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Update gradient layer frame when view size changes
        if let gradientLayer = contentView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = contentView.bounds
        }
    }
}
    
  
