//
//  MeViewController.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-15.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {
    
    //outlets
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func logoutButtonPressed(_ sender: Any) {
    }
    

}
