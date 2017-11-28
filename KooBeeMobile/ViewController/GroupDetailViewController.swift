//
//  GroupDetailViewController.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/22.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit
import WebKit

class GroupDetailViewController: UIViewController, WKUIDelegate, WKNavigationDelegate  {
    
    @IBOutlet weak var webView: WKWebView!
    
    var group: Group?
    
    override func loadView() {
        super.loadView()
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = group?.name
        load()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func load() {
        if let group = group{
            let url = URL(string: group.detailURL)
            let myRequest = URLRequest(url: url!)
            webView.load(myRequest)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
