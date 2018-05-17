//
//  MeViewController.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-15.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit
import Firebase

class MeViewController: UIViewController {
    
    //outlets
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.emailLabel.text = Auth.auth().currentUser?.email
        
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        
        let logoutPopout = UIAlertController(title: "Loggin out ?", message: "Are you sure you wanna log out", preferredStyle: .actionSheet)
        
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { (buttonTapped) in
            
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthViewController
                self.present(authVC!, animated: true, completion: nil )
            } catch {
                print(error)
            }
        }
        
        logoutPopout.addAction(logoutAction)
        present(logoutPopout, animated: true, completion: nil)
        
    }
    

}
