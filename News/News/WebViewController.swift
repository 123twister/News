//
//  WebViewController.swift
//  News
//
//  Created by Jay on 17/05/19.
//  Copyright © 2019 Jay Kaushal. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    
    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        webview.load(URLRequest(url: URL(string: url!)!))
        
    }
    


}
