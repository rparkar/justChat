//
//  UserCell.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-19.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    //outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    //variables
    var isShowing = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(profileImage image:UIImage, email: String, isSelected: Bool ) {
        
        self.profileImage.image = image
        self.emailLabel.text = email
        
        if isSelected{
            self.checkImage.isHidden = false
        } else {
            self.checkImage.isHidden = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            
            if isShowing == false {
                checkImage.isHidden = false
                isShowing = true
            } else {
                checkImage.isHidden = true
                isShowing = false
            }
            
        }
        
    }

}
