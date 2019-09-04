//
//  TermConditionVC.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 25/06/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit

class TermConditionVC: UIViewController {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://119.226.73.123/hplservice/")
        webView.loadRequest(URLRequest(url: url!))
        webView.scalesPageToFit = true

    }
    @IBAction func backBTN(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
