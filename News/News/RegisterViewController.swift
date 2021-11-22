//
//  RegisterViewController.swift
//  News
//
//  Created by Jay on 23/05/19.
//  Copyright © 2019 Jay Kaushal. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        emailText.delegate = self
        passwordText.delegate = self
        confirmPasswordText.delegate = self
        
        hideKeyboard()
    }
    
    @IBAction func signupBtn(_ sender: Any)
    {
        let userEmail = emailText.text
        let userPassword = passwordText.text
        let userConfirmPassword = confirmPasswordText.text
        
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userConfirmPassword?.isEmpty)!)
        {
            displayAlertMessage(userMessage: "All fields are empty!")
            return
        }
        
        if(userPassword != userConfirmPassword)
        {
            displayAlertMessage(userMessage: "Passwords do not match.")
            return
        }
        
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.synchronize()
        
        var alert = UIAlertController(title: "Alert", message: "Registration is successful!", preferredStyle: .alert)
        let Action = UIAlertAction(title: "Ok", style: .default){
            action in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(Action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func alreadyloginBtn(_ sender: Any)
    {
    
        self.dismiss(animated: true, completion: nil)
    }
    
    func hideKeyboard()
    {
        emailText.resignFirstResponder()
        passwordText.resignFirstResponder()
        confirmPasswordText.resignFirstResponder()
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
