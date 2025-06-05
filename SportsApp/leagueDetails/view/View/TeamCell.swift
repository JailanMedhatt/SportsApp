//
//  TeamCell.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 02/06/2025.
//

import UIKit
import Kingfisher


class TeamCell: UICollectionViewCell {
    static let reuseIdentifier = "TeamCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
       // view.layer.cornerRadius = 12
     //  view.layer.borderWidth = 1
     //  view.layer.borderColor = UIColor(hex: "#379C67").cgColor
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOpacity = 0.1
//        view.layer.shadowOffset = CGSize(width: 0, height: 2)
//        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let teamLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 2
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
        containerView.addSubview(teamLogo)
        containerView.addSubview(teamNameLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            teamLogo.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            teamLogo.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            teamLogo.widthAnchor.constraint(equalToConstant: 40),
            teamLogo.heightAnchor.constraint(equalToConstant: 40),
            
            teamNameLabel.topAnchor.constraint(equalTo: teamLogo.bottomAnchor, constant: 8),
            teamNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            teamNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            teamNameLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -12)
        ])
    }
    
    // use this
    
    func configure(team: Team) {   
        teamNameLabel.text = team.teamName
        teamLogo.kf.setImage(with: URL(string: team.teamLogo ?? "") , placeholder: UIImage(named: "f"))
        // teamLogo.image = UIImage(named: team.logo)
  
    }
    
    // ay 7aga 3ashan agarb
    
//    func configure(with title: String) {
//        teamLogo.image = UIImage(named: "ff")
//        teamNameLabel.text = title
//    
//    }
}

