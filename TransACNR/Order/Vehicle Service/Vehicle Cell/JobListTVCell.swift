//
//  JobListTVCell.swift
//  TransACNR
//
//  Created by Monish M S on 28/05/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class JobListTVCell: UITableViewCell {
    @IBOutlet weak var serviceNumber: UILabel!
    @IBOutlet weak var serviceStatus: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var vechilenumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
