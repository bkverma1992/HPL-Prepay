//
//  CatTableViewCell.swift
//  HPL Prepay
//
//  Created by Yugasalabs-28 on 25/06/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit

class CatTableViewCell: UITableViewCell {
    @IBOutlet var cstmView: UIView!
    @IBOutlet var lblCatName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
