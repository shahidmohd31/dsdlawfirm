//
//  CaseStatusViewController.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 15/06/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit

class CaseStatusViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var detailWebView: UIWebView!
    var urlStr: String?
    var navstr:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let strUrl = NSURL(string:urlStr!)
        let reguestObj = URLRequest(url: strUrl! as URL)
        detailWebView.loadRequest(reguestObj)
        detailWebView.delegate = self
        
        

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        //SwiftLoader.show(title: "Loading..", animated: true)
        navigationItem.title = navstr
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SwiftLoader.hide()
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        SwiftLoader.show(title: "Loading..", animated: true)
    }
    

}
