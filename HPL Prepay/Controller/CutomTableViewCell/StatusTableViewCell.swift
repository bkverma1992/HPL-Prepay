//
//  StatusTableViewCell.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 19/07/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTcktID: UILabel!
    @IBOutlet weak var lblGnrateDate: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblMsg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
