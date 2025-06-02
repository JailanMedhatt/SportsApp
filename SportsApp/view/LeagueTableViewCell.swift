//
//  LeagueTableViewCell.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 31/05/2025.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var leagueLabel: NSLayoutConstraint!
    @IBOutlet weak var leagueImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        leagueImage.layer.cornerRadius = leagueImage.frame.size.width / 2
           leagueImage.clipsToBounds = true
        
        containerView.layer.cornerRadius = 12
        containerView.layer.borderWidth = 3
       // containerView.layer.borderColor = UIColor(named: "CustomGreen")?.cgColor
        containerView.layer.masksToBounds = true
      //  containerView.layer.borderColor = UIColor.green.
        containerView.layer.borderColor = UIColor(
            red: 55/255.0,
            green: 156/255.0,
            blue: 103/255.0,
            alpha: 1.0
        ).cgColor


       // self.backgroundColor = .clear
       // self.contentView.backgroundColor = .clear

//        // Optional: shadow for card effect
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.1
//        self.layer.shadowOffset = CGSize(width: 0, height: 2)
//        self.layer.shadowRadius = 4
//        self.layer.masksToBounds = false
    }

    
}
