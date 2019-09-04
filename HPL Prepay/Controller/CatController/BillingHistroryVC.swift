//
//  BillingHistroryVC.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 26/06/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit
import SVProgressHUD

class BillingHistroryVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var billingTblView: UITableView!
    let serviceData = Service()
    var billingArr = NSArray()
    var consumerStr = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let res =  serviceData.Billing_history(Consumer_number: consumerStr)
        let xmlString: String = UserDefaults.standard.value(forKey: "xmlData") as Any as! String
       
            billingArr = convertJsonStringToDict(string: xmlString, key: "Billing History")
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        SVProgressHUD.dismiss()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return billingArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = billingTblView.dequeueReusableCell(withIdentifier: "BillingCell")!  as! BillingTableViewCell
 
        if UIScreen.main.sizeType == .iPhone5
        {
            cell.lblMonthlyBill.font = UIFont.systemFont(ofSize: 11)
            cell.lblMonthlyCharges.font = UIFont.systemFont(ofSize: 11)
            cell.lblFixCharges.font = UIFont.systemFont(ofSize: 11)
            cell.lblMinCharges.font = UIFont.systemFont(ofSize: 11)
            cell.lblConsumerCharges.font = UIFont.systemFont(ofSize: 11)
            cell.lblBalLeft.font = UIFont.systemFont(ofSize: 11)
            cell.lblEnergyAmt.font = UIFont.systemFont(ofSize: 11)
            cell.lblEnergyConsum.font = UIFont.systemFont(ofSize: 11)
            cell.lblDeduction.font = UIFont.systemFont(ofSize: 11)
        }
        
        cell.lblMonthlyBill.text = (billingArr[indexPath.row] as AnyObject).value(forKey: "BILL_MONTH") as? String
        cell.lblMonthlyCharges.text = (billingArr[indexPath.row] as AnyObject).value(forKey: "MONTHLY_CHARGES") as? String
        cell.lblFixCharges.text = (billingArr[indexPath.row] as AnyObject).value(forKey: "FIXED_CHARGES") as? String
        cell.lblMinCharges.text = (billingArr[indexPath.row] as AnyObject).value(forKey: "MINIMUM_CHARGES") as? String
        cell.lblConsumerCharges.text = (billingArr[indexPath.row] as AnyObject).value(forKey: "CONSUMER_CHARGES") as? String
        cell.lblBalLeft.text = (billingArr[indexPath.row] as AnyObject).value(forKey: "BALANCE_LEFT_RS") as? String
        cell.lblEnergyAmt.text = (billingArr[indexPath.row] as AnyObject).value(forKey: "AMOUNT_ON_ENERGY_RS") as? String
        cell.lblEnergyConsum.text = (billingArr[indexPath.row] as AnyObject).value(forKey: "CONSUMED_ENERGY_KWH") as? String
        cell.lblDeduction.text = (billingArr[indexPath.row] as AnyObject).value(forKey: "TOTAL_DEDUCTION_FOR_MONTH") as? String

        return cell
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
