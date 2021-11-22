//
//  Menu.swift
//  News
//
//  Created by Jay on 17/05/19.
//  Copyright © 2019 Jay Kaushal. All rights reserved.
//

import UIKit

class Menu: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let blackView = UIView()
    let menuTableView = UITableView()
    var array = ["TalkSport","The-Verge","TechCrunch","TechRadar","The-Economist","Reuters","Metro","MTV-News","Mirror","BBC-News"]
    var mainVC: ViewController?
    
    public func OpenMenu()
    {
        if let window = UIApplication.shared.keyWindow{
            blackView.frame = window.frame
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.3)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dissmissMenu)))
            
            let height: CGFloat = 250
            
            let y = window.frame.height - height
            menuTableView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            window.addSubview(blackView)
            window.addSubview(menuTableView)
            
            UIView.animate(withDuration: 0.2, animations: {
                self.blackView.alpha = 1
                self.menuTableView.frame.origin.y = y
                })
        }
    }
    
    @objc public func dissmissMenu()
    {
        UIView.animate(withDuration: 0.2, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.menuTableView.frame.origin.y = window.frame.height
            }
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = array[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = mainVC{
            vc.source = array[indexPath.item].lowercased()
            vc.fetchNews(fromSource: array[indexPath.item].lowercased())
            dissmissMenu()
        }
    }
    override init() {
        super.init()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        menuTableView.isScrollEnabled = true
        menuTableView.bounces = false
        
        menuTableView.register(EmptyViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }

}


