//
//  RechargeHistoryTableViewCell.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 06/07/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit

class RechargeHistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblPreviousBal: UILabel!
    @IBOutlet weak var lblNetBal: UILabel!
    @IBOutlet weak var lblRechargeDate: UILabel!
    @IBOutlet weak var lblPayMode: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
