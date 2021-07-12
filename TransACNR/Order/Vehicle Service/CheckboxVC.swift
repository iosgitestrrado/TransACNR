//
//  CheckboxVC.swift
//  TransACNR
//
//  Created by Monish M S on 30/04/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit
protocol complientAddDelegate: class {
    func complientreloaded()
}

class CheckboxVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var displayTable: UITableView!
    var menuListdisplay   =  [checkBoxModel]()
    var valueArray: [Bool] = []
     var complintTypeArray: [String] = []
    var delegateAdd: complientAddDelegate? = nil
      var complintReDisplayArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueArray.removeAll()
        for _ in menuListdisplay {
            valueArray.append(false)
        }
        
        if newSharedInstance.complintTypeArray.count > 0 {
            
            for item in menuListdisplay {
                
                
                
                if newSharedInstance.complintTypeArray.contains(item.checkBox_Id)  {
                    
                    complintReDisplayArray.append(item.checkBox_Name)
                    
                }
                
            }
            
            
            
            
        }
        
        
        
        
        
         displayTable.tableFooterView = UIView(frame: .zero)
       displayTable.reloadData()
        
        
        
    }
    @IBAction func tapGestureaction(_ sender: Any) {
        self.view .removeFromSuperview()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return menuListdisplay.count
        
        
    }
    
    
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
        
        
        return 50.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = CheckboxTableVCell()
        
        cell = displayTable.dequeueReusableCell(withIdentifier: "CheckBoxCell", for: indexPath ) as! CheckboxTableVCell
        
        
        configureMarketdisplayCell(cell: cell,forrowatindepath:indexPath as NSIndexPath)
        
        return cell
    }
    
    func configureMarketdisplayCell(cell:CheckboxTableVCell,forrowatindepath indexPath:NSIndexPath){
        
        let model : checkBoxModel = menuListdisplay[indexPath.row]

        
        
       
        cell.CheckboxHead.text = model.checkBox_Name
        cell.CheckboxBtn.tag = indexPath.row
        cell.CheckboxBtn.addTarget(self, action: #selector(CheckboxVC.connected(sender:)), for: .touchUpInside)
        if complintReDisplayArray.contains(model.checkBox_Name) {
            cell.CheckboxBtn.setImage(#imageLiteral(resourceName: "ic_checkbox_selected"), for: .normal)
            valueArray[indexPath.row] = true
        }else{
            cell.CheckboxBtn.setImage(#imageLiteral(resourceName: "ic_checkbox_empty"), for: .normal)
            valueArray[indexPath.row] = false
        }
        
    }
  

    
    @objc func connected(sender: UIButton){
        let buttonTag = sender.tag
        if   valueArray[buttonTag] == false {
            
            sender.setImage(#imageLiteral(resourceName: "ic_checkbox_selected"), for: .normal)
            valueArray[buttonTag] = true
        }else{
            valueArray[buttonTag] = false
            sender.setImage(#imageLiteral(resourceName: "ic_checkbox_empty"), for: .normal)
        }
    }
    
    @IBAction func saveComplintType(_ sender: UIButton) {
        
    
        
        var i:Int  = 0
        for item in valueArray {
            
            if item {
                 let model : checkBoxModel = menuListdisplay[i]
                
                complintTypeArray.append(model.checkBox_Id)
                
            }
            i = i + 1
            
        }
        if complintTypeArray.count > 0{
        
        newSharedInstance.complintTypeArray.removeAll()
        newSharedInstance.complaintType(dealing_PersonNameInit: complintTypeArray)
        }
        delegateAdd?.complientreloaded()
     self.view .removeFromSuperview()
        
        
    }
    
    
    
    
}
