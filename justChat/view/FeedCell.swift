//
//  FeedCell.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-16.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    //outlets
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentMessageLabel: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, contentMessage: String) {
        self.profileImage.image = profileImage
        self.emailLabel.text = email
        self.contentMessageLabel.text = contentMessage
        
    }
    
}
