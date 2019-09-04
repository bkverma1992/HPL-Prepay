//
//  BillingTableViewCell.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 06/07/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit

class BillingTableViewCell: UITableViewCell {
 
    @IBOutlet weak var lblMonthlyBill: UILabel!
    @IBOutlet weak var lblMonthlyCharges: UILabel!
    @IBOutlet weak var lblFixCharges: UILabel!
    @IBOutlet weak var lblMinCharges: UILabel!
    @IBOutlet weak var lblConsumerCharges: UILabel!
    @IBOutlet weak var lblBalLeft: UILabel!
    @IBOutlet weak var lblEnergyAmt: UILabel!
    @IBOutlet weak var lblEnergyConsum: UILabel!
    @IBOutlet weak var lblDeduction: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
