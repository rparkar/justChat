//
//  CreateGroupViewController.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-17.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class CreateGroupViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var emailSearchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupMemberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func doneButtonPressed(_ sender: Any) {
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
    }
    
}
