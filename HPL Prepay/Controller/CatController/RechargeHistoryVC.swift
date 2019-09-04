//
//  RechargeHistoryVC.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 26/06/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit
import SVProgressHUD

class RechargeHistoryVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var rechargeTblView: UITableView!
    let serviceData = Service()
    var rechargeHistryArr = NSArray()
    var consumerStr = String()


    override func viewDidLoad() {
        super.viewDidLoad()

        let res =  serviceData.recharge_history(Consumer_number: consumerStr)
        let xmlString: String = UserDefaults.standard.value(forKey: "xmlData") as Any as! String
       
            rechargeHistryArr = convertJsonStringToDict(string: xmlString, key: "Recharge History")
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        SVProgressHUD.dismiss()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return rechargeHistryArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = rechargeTblView.dequeueReusableCell(withIdentifier: "HistoryCell")!  as! RechargeHistoryTableViewCell

        if UIScreen.main.sizeType == .iPhone5
        {
            cell.lblAmount.font = UIFont.systemFont(ofSize: 11.5)
            cell.lblPreviousBal.font = UIFont.systemFont(ofSize: 11.5)
            cell.lblNetBal.font = UIFont.systemFont(ofSize: 11.5)
            cell.lblRechargeDate.font = UIFont.systemFont(ofSize: 11.5)
            cell.lblPayMode.font = UIFont.systemFont(ofSize: 11.5)
        }
        cell.lblAmount.text = (rechargeHistryArr[indexPath.row] as AnyObject).value(forKey: "RECHARGE_AMOUNT") as? String
        cell.lblPreviousBal.text = (rechargeHistryArr[indexPath.row] as AnyObject).value(forKey: "PREVIOS_BALANCE") as? String
        cell.lblNetBal.text = (rechargeHistryArr[indexPath.row] as AnyObject).value(forKey: "NET_BALANCE") as? String
        cell.lblRechargeDate.text = (rechargeHistryArr[indexPath.row] as AnyObject).value(forKey: "RECHARGE_DATE") as? String
        cell.lblPayMode.text = (rechargeHistryArr[indexPath.row] as AnyObject).value(forKey: "MODE_OF_PAYMENT") as? String

        return cell
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
