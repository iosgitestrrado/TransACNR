//
//  CheckboxTableVCell.swift
//  TransACNR
//
//  Created by Monish M S on 30/04/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class CheckboxTableVCell: UITableViewCell {
    @IBOutlet var CheckboxBtn: UIButton!
    @IBOutlet var CheckboxHead: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
