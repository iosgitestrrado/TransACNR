//
//  MenuSubListTableViewCell.swift
//  TransACNR
//
//  Created by Monish M S on 27/04/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class MenuSubListTableViewCell: UITableViewCell {
    @IBOutlet var menuSubImage: UIImageView!
    @IBOutlet var menuSubHead: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
