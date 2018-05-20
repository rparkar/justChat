//
//  GroupsFeedViewController.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-20.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class GroupsFeedViewController: UIViewController {

    //outlets
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendButtonView: UIView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: offsetTextField!
    
    //variables
    var group: Group?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButtonView.bindToKeyboard()

        // Do any additional setup after loading the view.
    }
    
    func initGroupData(forgroup group: Group) {
        self.group = group
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        groupTitleLabel.text = group?.groupTitle
        DataService.instance.getEmailsFor(group: group!) { (returnedEmails) in
            
            self.membersLabel.text = returnedEmails.joined(separator: ", ")
        }
        
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    


}
