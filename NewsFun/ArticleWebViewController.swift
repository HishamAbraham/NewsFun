//
//  ArticleWebViewController.swift
//  NewsFun
//
//  Created by Hisham Abraham on 6/1/18.
//  Copyright © 2018 Hisham Abraham. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebViewController: UIViewController {
    
    var article = Article()
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let url = URL(string: article.url){
            webView.load(URLRequest(url: url))
        }
        
        
    }


}
