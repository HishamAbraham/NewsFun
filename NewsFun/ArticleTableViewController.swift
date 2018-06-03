//
//  ArticleTableViewController.swift
//  NewsFun
//
//  Created by Hisham Abraham on 6/1/18.
//  Copyright © 2018 Hisham Abraham. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewController: UITableViewController {
    var articles = [Article]()

    fileprivate func getArticles() {
        NewsHelper().getArticles { (articles) in
            self.articles = articles
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        getArticles()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell {
        let article = articles[indexPath.row]
        cell.titleLabel.text = article.title
        cell.categoryLabel.text = article.category.rawValue
        cell.categoryLabel.backgroundColor = article.categoryColor
        let url = URL(string: article.urlToImage)
        cell.articleImageView.kf.setImage(with: url, placeholder: UIImage(named: "Filler"), options: nil, progressBlock: nil, completionHandler: nil)
        
        

        return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    @IBAction func reloadTapped(_ sender: UIBarButtonItem) {
        getArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToURL" {
            if let article = sender as? Article {
                if let webVC = segue.destination as? ArticleWebViewController {
                    webVC.article = article
                }
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        performSegue(withIdentifier: "goToURL", sender: article)
    }
    
}

class ArticleCell : UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
}
