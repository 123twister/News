//
//  MoreViewController.swift
//  News
//
//  Created by Jay on 21/05/19.
//  Copyright © 2019 Jay Kaushal. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
    @IBAction func TOI(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwj5peXbm6ziAhWRj-YKHTn-D8IQFjAAegQIBBAC&url=https%3A%2F%2Ftimesofindia.indiatimes.com%2F&usg=AOvVaw1lhLy9Kr2BIbyu19bA4kOY")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func timesNow(_ sender: Any) {
              UIApplication.shared.open(URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwijm-WGnKziAhWI7HMBHXiPDmwQFjAAegQIBRAC&url=https%3A%2F%2Fwww.timesnownews.com%2Flivetv&usg=AOvVaw076o079I6NNSrgyH3JAd8T")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func reuters(_ sender: Any) {
              UIApplication.shared.open(URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwj9u8KUnKziAhU66XMBHbRoBxgQFjAAegQIBhAC&url=https%3A%2F%2Fin.reuters.com%2F&usg=AOvVaw2Bc_q4Po99Zhe1PORxXoBl")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func theHindu(_ sender: Any) {
              UIApplication.shared.open(URL(string: "https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwjCzuKgnKziAhXYHCsKHa4VB7MYABAAGgJzZg&ae=1&ohost=www.google.com&cid=CAESQOD2i9VdSvyianTzsxgC8XhO_oF853Y8QwAHyClCcC0B1EKOLBjsAljSzaLsaaa5a-ViDsdjDbXQYmyKhSuB3Z8&sig=AOD64_2lFmh-cwT1jDsLw9KL6U2pTqxXzg&q=&ved=2ahUKEwi0u9qgnKziAhXzV3wKHXeLDqUQ0Qx6BAgJEAE&adurl=https://www.thehindu.com/news/national/%3Futm_source%3Dgoogle%26utm_medium%3Dcpc%26utm_campaign%3Dnational-th%26gclid%3DCj0KCQjww47nBRDlARIsAEJ34bmNgdSIzxLzH77tyMjMuzbCFqnx0ii5PZilNr2_3HeS8k3lSK-RxhEaAlMsEALw_wcB")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func indiaToday(_ sender: Any) {
              UIApplication.shared.open(URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwilq5ivnKziAhWxguYKHVmvCTYQFjAAegQIAxAC&url=https%3A%2F%2Fwww.indiatoday.in%2F&usg=AOvVaw27uLbaXhR3laLw8pZFI2MI")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func Ndtv(_ sender: Any) {
              UIApplication.shared.open(URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwjTx-a3nKziAhUlmuYKHWeAA1cQFjAAegQIAxAC&url=https%3A%2F%2Fwww.ndtv.com%2F&usg=AOvVaw3GGmXSurnbAC9bsIVIeM9R")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func ted(_ sender: Any) {
              UIApplication.shared.open(URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwiKmeS-nKziAhVFVXwKHfJlAAUQFjAAegQIAxAC&url=https%3A%2F%2Fwww.ted.com%2F&usg=AOvVaw38w6rMJjoK8HD-A9uA6afX")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func Newsnation(_ sender: Any) {
              UIApplication.shared.open(URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwjMk-bHnKziAhUlmuYKHWeAA1cQFjAAegQIAxAC&url=https%3A%2F%2Fwww.newsnation.in%2F&usg=AOvVaw39J2I_A7sY_WP_nZ3z7G98")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func zeeNews(_ sender: Any) {
              UIApplication.shared.open(URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwiiuOTPnKziAhU17HMBHZXNDL0QFjAAegQIBBAC&url=https%3A%2F%2Fzeenews.india.com%2F&usg=AOvVaw15vsf-Ox8ooIyL9wcva0K2")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func ABP(_ sender: Any) {
              UIApplication.shared.open(URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwjB7qPbnKziAhWs8XMBHa3_AKQQFjAAegQIAhAB&url=https%3A%2F%2Fabpnews.abplive.in%2F&usg=AOvVaw3RwNLvGU2kKxEXMqDRt2lM")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func indiaTv(_ sender: Any) {
              UIApplication.shared.open(URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwiK3YPinKziAhXRheYKHehhCwwQFjAAegQIBRAC&url=https%3A%2F%2Fwww.indiatvnews.com%2F&usg=AOvVaw1C5xYr9GnuXVb37oQbuBWZ")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func aajTak(_ sender: Any) {
              UIApplication.shared.open(URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwik3bDonKziAhV173MBHaehBe8QFjAAegQIAxAB&url=https%3A%2F%2Faajtak.intoday.in%2F&usg=AOvVaw0BwUMMxpYxuPpkSYyMOvYT")!, options: [:], completionHandler: nil)
    }
    
}
