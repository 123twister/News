//
//  LoginViewController.swift
//  News
//
//  Created by Jay on 23/05/19.
//  Copyright © 2019 Jay Kaushal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        email.delegate = self
        password.delegate = self
        
        hideKeyboard()
    }
    
    @IBAction func loginBtn(_ sender: Any)
    {
        
        let userEmail = email.text
        let userPassword = password.text
            
        let emailStored = UserDefaults.standard.string(forKey: "userEmail")
        let passwordStord = UserDefaults.standard.string(forKey: "userPassword")
            
        if(emailStored == email.text)
        {
            if(passwordStord == password.text)
            {
                
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        if((userEmail?.isEmpty)!) || ((userPassword?.isEmpty)!)
        {
            displayAlertMessage(userMessage: "All fields are empty")
            return
        }
        
        if(emailStored != email.text)
        {
            displayAlertMessage(userMessage: "Email or Password do not match.")
            return
        }else if(passwordStord != password.text)
        {
            displayAlertMessage(userMessage: "Email or Password do not match")
            return
        }
        
    }
    
    func hideKeyboard()
    {
        email.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func displayAlertMessage(userMessage: String)
    {
        var alert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    

}
