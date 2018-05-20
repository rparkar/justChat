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
    var choosenUserArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        
        emailSearchTextField.addTarget(self, action: #selector(textFieldeditingChanged), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        doneButton.isHidden = true
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
        
        if choosenUserArray.contains(emailArray[indexPath.row]) {
        
            cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        } else {
            
            cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: false)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else {return}
        
        if !choosenUserArray.contains(cell.emailLabel.text!) {
            choosenUserArray.append(cell.emailLabel.text!)
            groupMemberLabel.text = choosenUserArray.joined(separator: ", ")
            doneButton.isHidden = false
        } else {
            choosenUserArray = choosenUserArray.filter({ $0 != cell.emailLabel.text!})
            if choosenUserArray.count >= 1 {
                groupMemberLabel.text = choosenUserArray.joined(separator: ", ")
            } else {
                groupMemberLabel.text = "Add people to your group"
                doneButton.isHidden = true
                
            }
        }
        
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CreateGroupViewController: UITextFieldDelegate {
    
}
