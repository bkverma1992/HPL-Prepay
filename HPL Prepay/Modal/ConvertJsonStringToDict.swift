//
//  ConvertJsonStringToDict.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 19/07/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func convertJsonStringToDict(string: String, key: String) -> NSArray
    {
        var rechareArr = NSArray()
        
        let jsonString = string
        let jsonData = jsonString.data(using: String.Encoding.utf8)
        
        if let data = string.data(using: String.Encoding.utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                var dict = NSDictionary()
                dict = json! as NSDictionary
                rechareArr = NSArray()
                rechareArr = dict.value(forKey: key) as! NSArray
                print(rechareArr)
            } catch {
                showAlertMessage(titleStr: "HPL Prepay", messageStr: jsonString)
            }
        }
        return rechareArr
    }
}

