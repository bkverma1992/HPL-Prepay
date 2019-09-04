//
//  ConfigurationVC.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 25/06/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit

class ConfigurationVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var consumerTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        consumerTF.tintColor = UIColor .rgb(red: 247, green: 0, blue: 83)
        consumerTF.tintColorDidChange()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBTN(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func updateBTN(_ sender: Any) {
        guard let phone = consumerTF.text, phone != "" else {
            self.showAlertMessage(titleStr: "HPL PrePay", messageStr: "Please enter your consumer id.")
            return
        }
        
        if ConnectionCheck.isConnectedToNetwork()
        {
            print(consumerTF.text as Any)
            var consumerStr = String()
            consumerStr = consumerTF.text!
            UserDefaults.standard .setValue(consumerStr, forKey: "consumerKey")
            self.navigationController?.popViewController(animated: true)
        }
        else
        {
            self.showAlertMessage(titleStr: "HPL PrePay", messageStr: "Internet Connection not Available!")
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == consumerTF {
            let textstring = (consumerTF.text! as NSString).replacingCharacters(in: range, with: string)
            let length = textstring.count
            if length > 12 {
                return false
            }
        }
        
        return true
    }
    
}
