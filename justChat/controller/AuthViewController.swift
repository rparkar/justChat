//
//  AuthViewController.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-14.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginWithGClicked(_ sender: Any) {
    }
    
    @IBAction func loginWithFBPressed(_ sender: Any) {
    }
    
    @IBAction func loginWithEmailPressed(_ sender: Any) {
        
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
}
