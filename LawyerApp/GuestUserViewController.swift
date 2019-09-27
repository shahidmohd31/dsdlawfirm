//
//  GuestUserViewController.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 09/06/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit

class GuestUserViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var guestWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let strurl = "https://www.uscis.gov"
        let url2 = NSURL(string: strurl)
        let requrl = URLRequest(url: url2! as URL)
        guestWebView.loadRequest(requrl)
        guestWebView.delegate = self
        self.navigationController?.navigationBar.topItem?.title = " "

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        SwiftLoader.show(title: "Loading..", animated: true)
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SwiftLoader.hide()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "USCIS"
    }
}
