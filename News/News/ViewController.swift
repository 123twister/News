//
//  ViewController.swift
//  News
//
//  Created by Jay on 17/05/19.
//  Copyright © 2019 Jay Kaushal. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableview: UITableView!


    var articleCell: [ArticleCell] = []
    var articles: [Article]? = []
    var source = "the-verge"
    var searchNews = [String]()

    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if(!isUserLoggedIn)
        {
            self.performSegue(withIdentifier: "loginPage", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let content = UNMutableNotificationContent()
        content.title = "You have recieved a notification"
        content.body = "News"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "textIdentifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        fetchNews(fromSource: source)
    }
    
    @IBAction func more(_ sender: Any)
    {
        let more = UIAlertController(title: "Alert", message: "Do you want to logout? or do you want to read more news?", preferredStyle: .alert)
        let logout = UIAlertAction(title: "Logout", style: .destructive, handler: {
            UIAlertAction in
            UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
            self.performSegue(withIdentifier: "loginPage", sender: self)

        })
        
        let moreBtn = UIAlertAction(title: "More", style: .default, handler: {UIAlertAction in
            self.performSegue(withIdentifier: "more", sender: self)
        })
        
        more.addAction(moreBtn)
        more.addAction(logout)
        
        self.present(more, animated: true, completion: nil)
    }
    
    
    func fetchNews(fromSource provider: String)
    {
 
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=\(provider)&apiKey=a82df6a82d404965ad71265b50af0965")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            self.articles = [Article]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String : AnyObject]] {
                    for articleFromJson in articlesFromJson {
                        let article = Article()
                        if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let urlToImage = articleFromJson["urlToImage"] as? String, let publishedAt = articleFromJson["publishedAt"] as? String {
                            
                            article.author = author
                            article.desc = desc
                            article.heading = title
                            article.url = url
                            article.imageUrl = urlToImage
                            article.published = publishedAt
                        }
                        self.articles?.append(article)
                    }
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
                
            } catch let error {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        
        cell.title.text = self.articles?[indexPath.item].heading
        cell.desc.text = self.articles?[indexPath.item].desc
        cell.Author.text = self.articles?[indexPath.item].author
        cell.Time.text = self.articles?[indexPath.item].published
        cell.imgView.downloadImage(from: (self.articles?[indexPath.item].imageUrl)!)
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! WebViewController
        
        webView.url = self.articles?[indexPath.item].url
        self.present(webView, animated: true, completion: nil)
    }
    
    let menu = Menu()
    
    @IBAction func search(_ sender: Any)
    {
        menu.OpenMenu()
        menu.mainVC = self
    }

    @IBAction func shareBtn(_ sender: Any)
    {
        let activityController = UIActivityViewController(activityItems: [articleCell.count as Any], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        present(activityController, animated: true, completion: nil)
    }
    
    
    
}

extension UIImageView
{
    func downloadImage(from url: String){
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }

}


