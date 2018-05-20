//
//  CreateGroupViewController.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-17.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class CreateGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //outlets
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var emailSearchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupMemberLabel: UILabel!
    
    //variable
    var emailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        
        emailSearchTextField.addTarget(self, action: #selector(textFieldeditingChanged), for: .editingChanged)
        // Do any additional setup after loading the view.
    }

    @objc func textFieldeditingChanged() {
        
        if emailSearchTextField.text == ""  {
            emailArray = []
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!) { (emailArrayReturned) in
                
                self.emailArray = emailArrayReturned
                self.tableView.reloadData()
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else {return UITableViewCell()}
        let profileImage = UIImage(named: "defaultProfileImage")
        cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        return cell
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CreateGroupViewController: UITextFieldDelegate {
    
}
