//
//  GroupCell.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-20.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    //outlets
    
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var groupDescriptionLabel: UILabel!
    @IBOutlet weak var membersCountLabel: UILabel!
    

    func configureCell(groupTitle title: String, groupDescription description: String, memberCount: Int) {
        
        groupTitleLabel.text = title
        groupDescriptionLabel.text = description
        membersCountLabel.text = "\(memberCount)"
    }


}
