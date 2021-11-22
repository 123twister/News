//
//  Whatsapp.swift
//  News
//
//  Created by Jay on 19/05/19.
//  Copyright © 2019 Jay Kaushal. All rights reserved.
//

import UIKit

class WhatsAppActivity : UIActivity{
    
    override init() {
        self.text = ""
        
    }
    
    var text:String?
    
    
    override func activityType()-> String {
        return NSStringFromClass(self.classForCoder)
    }
    
    override func activityImage()-> UIImage
    {
        return UIImage(named: "whatsapp2")!;
    }
    
    override func activityTitle() -> String
    {
        return "WhatsApp";
    }
    
    override class func activityCategory() -> UIActivity.Category{
        return UIActivity.Category.share
    }
    
    func getURLFromMessage(message:String)-> NSURL
    {
        var url = "whatsapp://"
        
        if (message != "")
        {
            url = "\(url)send?text=\(message)"
        }
        
        return NSURL(string: url)!
    }
    
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for activityItem in activityItems
        {
            if (activityItem.isKind(NSString))
            {
                self.text = activityItem as? String;
                var whatsAppURL:NSURL  = self.getURLFromMessage(message: self.text!)
                return UIApplication.sharedApplication.canOpenURL(whatsAppURL)
            }
        }
        return false;
    }
    
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for activityItem in activityItems{
            if(activityItem.isKind(NSString)){
                var whatsAppUrl:NSURL = self.getURLFromMessage(message: self.text!)
                if(UIApplication.shared.canOpenURL(whatsAppUrl as URL)){
                    UIApplication.shared.openURL(whatsAppUrl as URL)
                }
                break;
            }
        }
}
}

