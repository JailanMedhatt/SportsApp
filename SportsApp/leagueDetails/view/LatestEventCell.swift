//
//  LatestEventCell.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 02/06/2025.
//

import UIKit

/*class LatestEventCell: UICollectionViewCell {

    let homeTeamLabel = UILabel()
    let awayTeamLabel = UILabel()
    let scoreLabel = UILabel()
    let timeLabel = UILabel()
    let dateLabel = UILabel()
    let separator = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        [homeTeamLabel, awayTeamLabel, scoreLabel, timeLabel, dateLabel, separator].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        homeTeamLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        awayTeamLabel.font = .systemFont(ofSize: 16, weight: .semibold)

        scoreLabel.font = .systemFont(ofSize: 20, weight: .bold)
        scoreLabel.textAlignment = .right

        timeLabel.font = .systemFont(ofSize: 14)
        timeLabel.textColor = .gray
        timeLabel.textAlignment = .right

        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .right

        separator.backgroundColor = .lightGray
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            homeTeamLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            homeTeamLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            awayTeamLabel.topAnchor.constraint(equalTo: homeTeamLabel.bottomAnchor, constant: 8),
            awayTeamLabel.leadingAnchor.constraint(equalTo: homeTeamLabel.leadingAnchor),

            scoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            scoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            timeLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 4),
            timeLabel.trailingAnchor.constraint(equalTo: scoreLabel.trailingAnchor),

            dateLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 2),
            dateLabel.trailingAnchor.constraint(equalTo: scoreLabel.trailingAnchor),

            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with title: String) {
       // homeTeamImage.image = UIImage(systemName: "person.circle")
       // awayTeamImage.image = UIImage(systemName: "person.circle")
        homeTeamLabel.text = title
        awayTeamLabel.text = title
        dateLabel.text = "22-5-2021"
        timeLabel.text = "12:00 PM"
        scoreLabel.text = "2-1"
        separator.isHidden = false
    
    }
}*/


/*class LatestEventCell: UICollectionViewCell {
    static let reuseIdentifier = "LatestMatchCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        //view.layer.borderColor = UIColor(hex: "#379C67").cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
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
        containerView.addSubview(scoreLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(homeTeamLabel)
        containerView.addSubview(awayTeamLabel)
        
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
            
            scoreLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            homeTeamLabel.trailingAnchor.constraint(equalTo: scoreLabel.leadingAnchor, constant: -16),
            homeTeamLabel.centerYAnchor.constraint(equalTo: scoreLabel.centerYAnchor),
            homeTeamLabel.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 12),
            
            awayTeamLabel.leadingAnchor.constraint(equalTo: scoreLabel.trailingAnchor, constant: 16),
            awayTeamLabel.centerYAnchor.constraint(equalTo: scoreLabel.centerYAnchor),
            awayTeamLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -12)
        ])
    }
    
    func configure(with match: Match) {
        homeTeamLabel.text = match.homeTeam
        awayTeamLabel.text = match.awayTeam
        dateLabel.text = match.date
        timeLabel.text = match.time
        scoreLabel.text = match.score
    }
}*/

class LatestEventCell: UICollectionViewCell {
    static let reuseIdentifier = "LatestMatchCell"
    
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
        containerView.addSubview(dateLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(scoreLabel)
        containerView.addSubview(vsLabel)
        
        // Setup home team stack
        homeTeamStack.addArrangedSubview(homeTeamLogo)
        homeTeamStack.addArrangedSubview(homeTeamLabel)
        containerView.addSubview(homeTeamStack)
        
        // Setup away team stack
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
            awayTeamStack.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -12)
        ])
    }
    
//    func configure(with match: Match) {
//        homeTeamLabel.text = match.homeTeam
//        awayTeamLabel.text = match.awayTeam
//        dateLabel.text = match.date
//        timeLabel.text = match.time
//        scoreLabel.text = match.score
//        
//        // Set team logos (replace with your image loading logic)
//        homeTeamLogo.image = UIImage(named: match.homeTeamLogo)
//        awayTeamLogo.image = UIImage(named: match.awayTeamLogo)
//    }
    
    func configure(with title: String) {
        homeTeamLogo.image = UIImage(named: "b")
       awayTeamLogo.image = UIImage(named: "t")
        homeTeamLabel.text = title
        awayTeamLabel.text = title
        dateLabel.text = "22-5-2021"
        timeLabel.text = "12:00 PM"
        scoreLabel.text = "2-1"
        //separator.isHidden = false
    
    }
    
    
}

