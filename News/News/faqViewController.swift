//
//  faqViewController.swift
//  News
//
//  Created by Jay on 19/05/19.
//  Copyright © 2019 Jay Kaushal. All rights reserved.
//

import UIKit
import MessageUI

class faqViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate{
    

    @IBOutlet weak var feed: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var mobile: UITextField!
    
     let toolBar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobile.delegate = self
        feed.delegate = self
        email.delegate = self
        
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([doneButton], animated: false)
        mobile.inputAccessoryView = toolBar
        
        hideboard()
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
   
  
    
    func hideboard()
    {
        feed.resignFirstResponder()
        email.resignFirstResponder()
        mobile.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideboard()
        return true
    }
    
   
    
    
    @IBAction func send(_ sender: Any)
    {
        
        let recepient = ["123jayvedant@gmail.com"]
        
        let mc : MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        
        mc.setToRecipients(recepient)
        mc.setSubject("Feedback")
        
        mc.setMessageBody("Complaint: \(feed.text!) \n\n Email: \(email.text!) \n\n Mobile No.: \(mobile.text!)", isHTML: false)
        self.present(mc, animated: true, completion: nil)
    }
    

    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResult.failed.rawValue:
            print("Failed")
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
        default:
            break
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
