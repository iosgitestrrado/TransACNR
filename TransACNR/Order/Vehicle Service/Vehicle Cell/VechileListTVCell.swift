//
//  VechileListTVCell.swift
//  TransACNR
//
//  Created by Monish M S on 14/05/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class VechileListTVCell: UITableViewCell {
    
    
    @IBOutlet weak var serviceName: UILabel!
    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var assignedToName: UILabel!
    @IBOutlet weak var colorImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
      //  initCellItem()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
    

   
    
        func initCellItem() {
            
            let deselectedImage = UIImage(named: "ic_checkbox_selected")
            let selectedImage = UIImage(named: "ic_checkbox_empty")
            radioButton.setImage(deselectedImage, for: .normal)
            radioButton.setImage(selectedImage, for: .selected)
            radioButton.addTarget(self, action: #selector(self.radioButtonTapped), for: .touchUpInside)
        }
        
    @objc func radioButtonTapped(_ radioButton: UIButton) {
           
            let isSelected = !self.radioButton.isSelected
            self.radioButton.isSelected = isSelected
            if isSelected {
                deselectOtherButton()
            }
            
        }
        
        func deselectOtherButton() {
            let tableView = self.superview?.superview as! UITableView
            let tappedCellIndexPath = tableView.indexPath(for: self)!
            let section = tappedCellIndexPath.section
            let rowCounts = tableView.numberOfRows(inSection: section)
            
            for row in 0..<rowCounts {
                if row != tappedCellIndexPath.row {
                    let cell = tableView.cellForRow(at: IndexPath(row: row, section: section)) as! VechileListTVCell
                    cell.radioButton.isSelected = false
                }
            }
        }
        
    }

