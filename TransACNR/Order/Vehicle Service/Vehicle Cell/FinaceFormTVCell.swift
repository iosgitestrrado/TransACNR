//
//  FinaceFormTVCell.swift
//  TransACNR
//
//  Created by Monish M S on 05/06/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class FinaceFormTVCell: UITableViewCell {

    @IBOutlet var spareHead: UILabel!
    @IBOutlet var spareCount: UILabel!
    @IBOutlet var spareRem: UILabel!

     @IBOutlet var spareEdit: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
