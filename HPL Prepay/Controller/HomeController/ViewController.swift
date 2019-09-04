//
//  ViewController.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 25/06/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tblMenu: UITableView!
    @IBOutlet var tblCat: UITableView!
    let serviceData = Service()

    @IBOutlet var menuBTN: UIButton!
    
    var dataArray = [String]()
    var catArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        dataArray = ["Configuration","About","Privacy Policy","Exit"]
        catArray = ["Recharge History","Account Summary","Billing History","Recharge","Complaints"]

        tblMenu.isHidden = true
        self.tblMenu.backgroundColor = UIColor.rgb(red: 162, green: 226, blue: 232)
        
        let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView
        if statusBar?.responds(to: #selector(setter: UIView.backgroundColor)) ?? false {
            statusBar?.backgroundColor = .rgb(red: 58, green: 46, blue: 161)
        }
        }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        SVProgressHUD.dismiss()

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView==tblMenu {
             return dataArray.count
        }
        if tableView==tblCat {
            return catArray.count
        }
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblMenu.dequeueReusableCell(withIdentifier: "MenuCell")!  as! MenuTableViewCell

        if tableView==tblMenu
        {
            let cell = tblMenu.dequeueReusableCell(withIdentifier: "MenuCell")!  as! MenuTableViewCell
            let titleName = dataArray[indexPath.row]
            cell.lblMenuCatName.text = titleName
            return cell
        }
        if tableView==tblCat
        {
            let cell = tblCat.dequeueReusableCell(withIdentifier: "CatCell")!  as! CatTableViewCell
            let titleName = catArray[indexPath.row]
            cell.lblCatName.text = titleName

            cell.cstmView.layer.masksToBounds = false
            cell.cstmView.layer.shadowRadius = 2
            cell.cstmView.layer.shadowOpacity = 1
            cell.cstmView.layer.shadowColor = UIColor.gray.cgColor
            cell.cstmView.layer.shadowOffset = CGSize(width: 0 , height:1)
            
            if indexPath.row==0
            {
                cell.cstmView.backgroundColor = UIColor .rgb(red: 30, green: 145, blue: 255)
            }
            if indexPath.row==1
            {
                cell.cstmView.backgroundColor = UIColor .rgb(red: 34, green: 139, blue: 34)
            }
            if indexPath.row==2
            {
                cell.cstmView.backgroundColor = UIColor .rgb(red: 138, green: 43, blue: 226)
            }
            if indexPath.row==3
            {
                cell.cstmView.backgroundColor = UIColor .rgb(red: 165, green: 42, blue: 42)
            }
            if indexPath.row==4
            {
                cell.cstmView.backgroundColor = UIColor .rgb(red: 210, green: 105, blue: 30)
            }
            
            return cell
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if tableView==tblMenu
        {
            tblMenu.isHidden = true
            if indexPath.row==0
            {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ConfigurationVC") as? ConfigurationVC
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else if indexPath.row==1
            {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AboutVC") as? AboutVC
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else if indexPath.row==2
            {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TermConditionVC") as? TermConditionVC
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else if indexPath.row==3
            {
                exit(0)
            }
        }
        else
        {
            if indexPath.row==0
            {
                if UserDefaults.standard.value(forKey: "consumerKey") != nil
                {
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RechargeHistoryVC") as? RechargeHistoryVC
                    vc?.consumerStr = UserDefaults.standard.value(forKey: "consumerKey") as! String
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
                else
                {
                    DispatchQueue.main.async {
                        self.showAlertMessage(titleStr: "HPL PrePay", messageStr: "Please Enter Consumer No")
                        };
                }
            }
            else if indexPath.row==1
            {
                if UserDefaults.standard.value(forKey: "consumerKey") != nil
                {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AccountSummeryVC") as? AccountSummeryVC
                    vc?.consumerStr = UserDefaults.standard.value(forKey: "consumerKey") as! String
                self.navigationController?.pushViewController(vc!, animated: true)
                }
                else
                {
                    DispatchQueue.main.async {
                        self.showAlertMessage(titleStr: "HPL PrePay", messageStr: "Please Enter Consumer No")
                    };
                }
            }
            else if indexPath.row==2
            {
                if UserDefaults.standard.value(forKey: "consumerKey") != nil
                {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BillingHistroryVC") as? BillingHistroryVC
                    vc?.consumerStr = UserDefaults.standard.value(forKey: "consumerKey") as! String
                self.navigationController?.pushViewController(vc!, animated: true)
                }
                else
                {
                    DispatchQueue.main.async {
                        self.showAlertMessage(titleStr: "HPL PrePay", messageStr: "Please Enter Consumer No")
                    };
                }
            }
            else if indexPath.row==3
            {
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RechargeVC") as? RechargeVC
//                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else if indexPath.row==4
            {
                if UserDefaults.standard.value(forKey: "consumerKey") != nil
                {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ComplaintsVC") as? ComplaintsVC
                    vc?.consumerStr = UserDefaults.standard.value(forKey: "consumerKey") as! String
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
                else
                {
                    DispatchQueue.main.async {
                        self.showAlertMessage(titleStr: "HPL PrePay", messageStr: "Please Enter Consumer No")
                    };
                }
            }
        }
    }
    
    
    @IBAction func menuButton(_ sender: UIButton)
    {
        tblMenu.isHidden = false
    }
    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
//    {
//
//
//        if touches.view != tblMenu {
//
//            tblMenu.isHidden = true
//        }
//        else
//        {
//            tblMenu.isHidden = true
//        }
//    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
