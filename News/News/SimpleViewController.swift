//
//  SimpleViewController.swift
//  News
//
//  Created by Jay on 21/05/19.
//  Copyright © 2019 Jay Kaushal. All rights reserved.
//

import UIKit

class SimpleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if(!isUserLoggedIn)
        {
        self.performSegue(withIdentifier: "loginPage", sender: self)
        }
    }

}
