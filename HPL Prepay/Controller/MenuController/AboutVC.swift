//
//  AboutVC.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 25/06/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {
    @IBOutlet var lblAppVersion: UILabel!
    var getVersion = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        print(appVersion as Any)
        getVersion = String(format: "Ver = %@", appVersion!)
        print(getVersion)

        lblAppVersion.text = getVersion
        
        // Do any additional setup after loading the view.
    }

    @IBAction func backBTN(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
