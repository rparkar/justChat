//
//  GroupsFeedViewController.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-20.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit
import Firebase

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
     var groupMessages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButtonView.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
        

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
        
        DataService.instance.getAllMessagesFor(desiredGroup: self.group!) { (returnGrpMsg) in
            
            self.groupMessages = returnGrpMsg
            self.tableView.reloadData()
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendButton.isEnabled = false
            
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: Auth.auth().currentUser!.uid, withGroupKey: group?.key) { (complete) in
                
                if complete {
                    self.messageTextField.text = ""
                    self.sendButton.isEnabled = true
                    self.messageTextField.isEnabled = true
                }
            }
        }
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    


}

extension GroupsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupsFeedCell", for: indexPath) as? GroupsFeedCell else {return UITableViewCell()}
        
        let message = groupMessages[indexPath.row]
        DataService.instance.getUsername(forUID: message.sender) { (email) in
            
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
            
        }
        
        return cell
        
    }
}
