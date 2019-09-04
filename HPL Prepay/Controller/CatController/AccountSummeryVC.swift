//
//  AccountSummeryVC.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 26/06/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit
import SVProgressHUD

class AccountSummeryVC: UIViewController {

    let serviceData = Service()
    var consumerStr = String()
    var acountSummeryArr = NSArray()

    @IBOutlet weak var lblRechargeAmt: UILabel!
    @IBOutlet weak var lblLastRecharge: UILabel!
    @IBOutlet weak var lblTotalRecharge: UILabel!
    @IBOutlet weak var lblBalLeft: UILabel!
    @IBOutlet weak var lblConsumerNumber: UILabel!
    @IBOutlet weak var lblSerialNmbr: UILabel!
    @IBOutlet weak var lblTraficCat: UILabel!
    @IBOutlet weak var lblRelayStatus: UILabel!
    @IBOutlet weak var lblAssignmentDate: UILabel!
    @IBOutlet weak var lblTotalConsumeEnergy: UILabel!
    @IBOutlet weak var lblConsumedAmt: UILabel!
    @IBOutlet weak var lblConsumedEnergy: UILabel!
    @IBOutlet weak var lblSlabRate: UILabel!
    @IBOutlet var dataView: UIView!

    
        override func viewDidLoad() {
        super.viewDidLoad()

        dataView.isHidden = true
        let res =  serviceData.Account_summary(Consumer_number: consumerStr)
        let xmlString: String = UserDefaults.standard.value(forKey: "xmlData") as Any as! String
        
            acountSummeryArr = convertJsonStringToDict(string: xmlString, key: "Account Summary")
            if acountSummeryArr.count > 0
            {
                self.dataView.isHidden = true

                if UIScreen.main.sizeType == .iPhone5
                {
                    lblRechargeAmt.font = UIFont.systemFont(ofSize: 11.5)
                    lblLastRecharge.font = UIFont.systemFont(ofSize: 11.5)
                    lblTotalRecharge.font = UIFont.systemFont(ofSize: 11.5)
                    lblBalLeft.font = UIFont.systemFont(ofSize: 11.5)
                    lblConsumerNumber.font = UIFont.systemFont(ofSize: 11.5)
                    lblSerialNmbr.font = UIFont.systemFont(ofSize: 11.5)
                    lblTraficCat.font = UIFont.systemFont(ofSize: 11.5)
                    lblRelayStatus.font = UIFont.systemFont(ofSize: 11.5)
                    lblAssignmentDate.font = UIFont.systemFont(ofSize: 11.5)
                    lblTotalConsumeEnergy.font = UIFont.systemFont(ofSize: 11.5)
                    lblConsumedAmt.font = UIFont.systemFont(ofSize: 11.5)
                    lblConsumedEnergy.font = UIFont.systemFont(ofSize: 11.5)
                    lblSlabRate.font = UIFont.systemFont(ofSize: 11.5)
                }
                
                lblRechargeAmt.text = (acountSummeryArr[0] as AnyObject).value(forKey: "Recharge_amount") as? String
                lblLastRecharge.text = (acountSummeryArr[0] as AnyObject).value(forKey: "lastrecharge") as? String
                lblTotalRecharge.text = (acountSummeryArr[0] as AnyObject).value(forKey: "totalRecharge") as? String
                lblBalLeft.text = (acountSummeryArr[0] as AnyObject).value(forKey: "BALANCE_LEFT") as? String
                lblConsumerNumber.text = (acountSummeryArr[0] as AnyObject).value(forKey: "consumer_number") as? String
                lblSerialNmbr.text = (acountSummeryArr[0] as AnyObject).value(forKey: "serial_number") as? String
                lblTraficCat.text = (acountSummeryArr[0] as AnyObject).value(forKey: "TARIFF_CATEGORY") as? String
                lblRelayStatus.text = (acountSummeryArr[0] as AnyObject).value(forKey: "RELAYSTATUS") as? String
                lblAssignmentDate.text = (acountSummeryArr[0] as AnyObject).value(forKey: "date_of_assignment") as? String
                lblTotalConsumeEnergy.text = (acountSummeryArr[0] as AnyObject).value(forKey: "TOTAL_CONSUMED_ENERGY") as? String
                lblConsumedAmt.text = (acountSummeryArr[0] as AnyObject).value(forKey: "CURRENT_MONTH_CONSUMED_AMOUNT") as? String
                lblConsumedEnergy.text = (acountSummeryArr[0] as AnyObject).value(forKey: "CURRENT_MONTH_CONSUMED_ENERGY") as? String
                lblSlabRate.text = (acountSummeryArr[0] as AnyObject).value(forKey: "SLAB_RATE") as? String
                
            }
            else
            {
                    self.dataView.isHidden = false
            }

          // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        SVProgressHUD.dismiss()
        
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
