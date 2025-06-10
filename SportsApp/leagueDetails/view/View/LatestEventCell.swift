//
//  LatestEventCell.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 02/06/2025.
//

import UIKit
import Kingfisher

class LatestEventCell: UICollectionViewCell {
    static let reuseIdentifier = "LatestMatchCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#337435").cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emptyStateLabel: UILabel = {
           let label = UILabel()
           label.text = "No Recent Matches"
           label.textAlignment = .center
           label.textColor = .darkGray
           label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
           label.isHidden = true
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scoreStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return iv
    }()
    
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
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
        iv.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return iv
    }()
    
    private let awayTeamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
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
        containerView.addSubview(scoreLabel)
        containerView.addSubview(vsLabel)
        
       
        homeTeamStack.addArrangedSubview(homeTeamLogo)
        homeTeamStack.addArrangedSubview(homeTeamLabel)
        containerView.addSubview(homeTeamStack)
        
       
        awayTeamStack.addArrangedSubview(awayTeamLogo)
        awayTeamStack.addArrangedSubview(awayTeamLabel)
        containerView.addSubview(awayTeamStack)
        
        scoreStack.addArrangedSubview(vsLabel)
        scoreStack.addArrangedSubview(scoreLabel)
        containerView.addSubview(scoreStack)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            timeLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            scoreStack.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 16),
            scoreStack.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            homeTeamStack.trailingAnchor.constraint(equalTo: scoreStack.leadingAnchor, constant: -48),
            homeTeamStack.centerYAnchor.constraint(equalTo: scoreStack.centerYAnchor),
            homeTeamStack.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 12),
            
            awayTeamStack.leadingAnchor.constraint(equalTo: scoreStack.trailingAnchor, constant: 48),
            awayTeamStack.centerYAnchor.constraint(equalTo: scoreStack.centerYAnchor),
            awayTeamStack.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -12),
            
            
            emptyStateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emptyStateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            emptyStateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emptyStateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    
    func configure(event : Event?) {

        if let event = event {
            vsLabel.isHidden = false
            emptyStateLabel.isHidden = true
            homeTeamLogo.kf.setImage(with: URL(string: event.participant1Logo ?? "") , placeholder: UIImage(named: "football"))
            awayTeamLogo.kf.setImage(with: URL(string: event.participant2Logo ?? "") , placeholder: UIImage(named: "football"))
            homeTeamLabel.text = event.participant1Name
            awayTeamLabel.text = event.participant2Name
            dateLabel.text = event.eventDate
            timeLabel.text = event.eventTime
            scoreLabel.text = event.eventFinalResult
            
        }else{
            vsLabel.isHidden = true
            emptyStateLabel.isHidden = false
        }
              
    
    }
    
    
}

