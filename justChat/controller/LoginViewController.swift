//
//  LoginViewController.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-14.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    //outlets
    @IBOutlet weak var emailTextField: offsetTextField!
    @IBOutlet weak var passwordTextField: offsetTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        if emailTextField.text != nil && passwordTextField.text != nil {
            AuthService.instance.loginUser(withEmail: emailTextField.text!, withPassword: passwordTextField.text!) { (success, loginerror) in
                
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginerror?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailTextField.text!, andPasswrd: self.passwordTextField.text!, userCreateComplete: { (success, registerError) in
                    
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailTextField.text!, withPassword: self.passwordTextField.text!, userLogedInComplete: { (success, nil) in
               
                            self.dismiss(animated: true, completion: nil)
                        })
                    }
                    
                    else {
                        print(String(describing: registerError?.localizedDescription))
                    }
                    
                })
            }
        }
        
    }
    
    
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    

}
