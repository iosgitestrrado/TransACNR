//
//  OrderlistTableViewCell.swift
//  TransACNR
//
//  Created by Monish M S on 09/08/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class OrderlistTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceName: UILabel!
    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var arrovd: UILabel!
    @IBOutlet weak var busImage: UIImageView!
    @IBOutlet weak var active: UILabel!
    @IBOutlet weak var radioButtonWidth: NSLayoutConstraint!
     @IBOutlet weak var aprrovdview: UIView!
    
    @IBOutlet weak var dispatchViewWidth: NSLayoutConstraint!
    @IBOutlet weak var dispatchView: UIView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
