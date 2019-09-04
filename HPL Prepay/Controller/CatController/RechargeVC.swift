//
//  RechargeVC.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 25/06/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit
import SVProgressHUD

class RechargeVC: UIViewController,UIWebViewDelegate {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        let url = URL(string: "")
//        webView.loadRequest(URLRequest(url: url!))
//        webView.scalesPageToFit = true
//        webView.delegate = self
        webView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show()
    }
   
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        SVProgressHUD.dismiss()
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        SVProgressHUD.dismiss()
    }
    
}
