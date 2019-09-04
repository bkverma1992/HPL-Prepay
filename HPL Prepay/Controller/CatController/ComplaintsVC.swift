//
//  ComplaintsVC.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 26/06/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit
import SVProgressHUD

class ComplaintsVC: UIViewController,UITextViewDelegate ,UITableViewDelegate,UITableViewDataSource{
    let serviceData = Service()
    var consumerStr = String()

    @IBOutlet var complaintStatusBtn: UIButton!
    @IBOutlet var complaintRegisterBtn: UIButton!
    @IBOutlet var compTextView: UITextView!
    
    @IBOutlet var lblConsumerId: UILabel!
    @IBOutlet var lblRegisterLine: UILabel!
    @IBOutlet var lblStatusLine: UILabel!
    @IBOutlet var statusView: UIView!

    @IBOutlet var lblAfterRegisterStatus: UILabel!
    @IBOutlet var registerBTN: UIButton!
    @IBOutlet var cancelBTN: UIButton!
    
    @IBOutlet var enterTextLBL: UILabel!
    var statusArr = NSArray()
    
    @IBOutlet weak var statusTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusView.isHidden = true
        lblStatusLine.isHidden = true
      //  isbeauty.setTitleColor(UIColorFromRGB("F21B3F"), forState: .Normal)
        complaintRegisterBtn.setTitleColor(UIColor.rgb(red: 134, green: 0, blue: 21), for: .normal)
        complaintStatusBtn.setTitleColor(UIColor.black, for:.normal)
        lblConsumerId.text = consumerStr

        compTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        compTextView.layer.borderWidth = 1.0
        compTextView.layer.cornerRadius = 5
        compTextView.tintColor = UIColor .rgb(red: 247, green: 0, blue: 83)
        compTextView.tintColorDidChange()
        compTextView.delegate = self
        compTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        
        enterTextLBL .isHidden = true

        //compTextView.text = "Enter Text........"
        compTextView.textColor = UIColor.rgb(red: 134, green: 0, blue: 21)
        compTextView.delegate = self

    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        SVProgressHUD.dismiss()
        
    }
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)

    }
 
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func complaintRegisterButton(_ sender: Any)
    {
            complaintRegisterBtn.setTitleColor(UIColor.rgb(red: 134, green: 0, blue: 21), for: .normal)
            complaintStatusBtn.setTitleColor(UIColor.black, for:.normal)
            lblRegisterLine.isHidden = false
            statusView.isHidden = true
            lblStatusLine.isHidden = true
    }
    @IBAction func compaintsStatusButton(_ sender: Any) {
       
        let res =  serviceData.complaint_reqhistory(Consumer_number: consumerStr)
        let xmlString: String = UserDefaults.standard.value(forKey: "xmlData") as Any as! String

            statusArr = convertJsonStringToDict(string: xmlString, key: "Request_Complaint_History")
            print(statusArr)
            
            if statusArr.count > 0
            {
                statusTblView.isHidden = false
                statusTblView.delegate = self
                statusTblView.dataSource = self
                statusTblView.reloadData()
            }
            else
            {
                statusTblView.isHidden = true
                self.showAlertMessage(titleStr: "HPL PrePay", messageStr: "Data Not Found")
            }
        
        complaintRegisterBtn.setTitleColor(UIColor.black, for:.normal)
        complaintStatusBtn.setTitleColor(UIColor.rgb(red: 134, green: 0, blue: 21), for: .normal)
        lblRegisterLine.isHidden = true
        statusView.isHidden = false
        lblStatusLine.isHidden = false
    }
    
    func showSimpleAlert(string: String) {
        let alert = UIAlertController(title: "HPL PrePay", message: string,  preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
                                        
                                        self.compTextView.resignFirstResponder()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func cancelBTN(_ sender: Any)
    {
        self.lblAfterRegisterStatus.isHidden = true
        self.registerBTN.isUserInteractionEnabled = true
        
    }
    @IBAction func registerBTN(_ sender: Any) {
                if compTextView.text == ""
                {
                    self.showAlertMessage(titleStr: "HPL PrePay", messageStr: "Enter Your Complaint")
                }
                else
                {
                    let res =  serviceData.consumer_complaint(Consumer_number: consumerStr, Complaint_msg: compTextView.text)
                    let xmlString: String = UserDefaults.standard.value(forKey: "xmlData") as Any as! String

                    if xmlString == "Consumer Information Not Found" {
                        DispatchQueue.main.async {
                            self.showSimpleAlert(string: xmlString)
                        };
                    }
                    else if (xmlString=="Consumer Not Found")
                    {
                        DispatchQueue.main.async {
                            self.showSimpleAlert(string: xmlString)

                        };
                    }
                    else if xmlString == ""
                   {
                        showAlertMessage(titleStr: "HPL Prepay", messageStr: "Consumer Information Not Found")
                    }
                    else
                   {
               let alert = UIAlertController(title: "HPL PrePay", message: "Complaint Succesfully Registred", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                 switch action.style{
                    case .default:
                         print("default")
                        self.lblAfterRegisterStatus.isHidden = false
                       //"Refernce ID : anyType{%@}"
                         self.compTextView.resignFirstResponder()
                        self.lblAfterRegisterStatus.text = String(format: "Refernce ID : %@", xmlString)
                        self.registerBTN.isUserInteractionEnabled = false
                   case .cancel:
                        print("cancel")
            case .destructive:
                      print("destructive")
            }}))
        self.present(alert, animated: true, completion: nil)
          }
        }
    }
    
 
    func textViewDidBeginEditing(_ textView: UITextView)
    {
            if UIDevice().userInterfaceIdiom == .phone {
                switch UIScreen.main.nativeBounds.height {
                case 1136:
                    animateViewMoving(up: true, moveValue: 120)
                case 1334:
                    animateViewMoving(up: true, moveValue: 90)
                case 1920, 2208:
                    animateViewMoving(up: true, moveValue: 130)//125
                case 2436:
                    animateViewMoving(up: true, moveValue: 190)//125
                case 2688:
                    print("IPHONE XS_MAX")
                    animateViewMoving(up: true, moveValue: 190)//125
                case 1792:
                    print("IPHONE XR")
                default:
                    animateViewMoving(up: true, moveValue: 190)//125
                }
            }
        }
  
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                    animateViewMoving(up: false, moveValue: 120)
            case 1334:
                    animateViewMoving(up: false, moveValue: 90)
            case 1920, 2208:
                    animateViewMoving(up: false, moveValue: 130)//125
            case 2436:
                    animateViewMoving(up: false, moveValue: 190)//125
            case 2688:
                print("IPHONE XS_MAX")
                    animateViewMoving(up: false, moveValue: 190)//125
            case 1792:
                print("IPHONE XR")
            default:
                    animateViewMoving(up: false, moveValue: 190)//125
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return statusArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = statusTblView.dequeueReusableCell(withIdentifier: "StatusCell")!  as! StatusTableViewCell
       
        if UIScreen.main.sizeType == .iPhone5
        {
            cell.lblTcktID.font = UIFont.systemFont(ofSize: 11.5)
            cell.lblGnrateDate.font = UIFont.systemFont(ofSize: 11.5)
            cell.lblStatus.font = UIFont.systemFont(ofSize: 11.5)
            cell.lblMsg.font = UIFont.systemFont(ofSize: 11.5)
        }
        cell.lblTcktID.text = (statusArr[indexPath.row] as AnyObject).value(forKey: "TICKETID") as? String
        cell.lblGnrateDate.text = (statusArr[indexPath.row] as AnyObject).value(forKey: "GENERATE_DATE") as? String
        cell.lblStatus.text = (statusArr[indexPath.row] as AnyObject).value(forKey: "STATUS") as? String
        cell.lblMsg.text = (statusArr[indexPath.row] as AnyObject).value(forKey: "MESSAGE") as? String
        return cell
    }
}

extension UITextView {
    
    func addDoneButton(title: String, target: Any, selector: Selector) {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))//1
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)//3
        toolBar.setItems([flexible, barButton], animated: false)//4
        self.inputAccessoryView = toolBar//5
    }
}

extension  UIViewController
{
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
}
