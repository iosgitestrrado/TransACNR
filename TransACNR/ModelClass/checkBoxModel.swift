//
//  checkBoxModel.swift
//  TransACNR
//
//  Created by Monish M S on 30/04/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class checkBoxModel: NSObject {

        var checkBox_Id :String!
        var checkBox_Name :String!
        
        
        override init() {
            super.init()
        
            self.checkBox_Id = ""
            self.checkBox_Name = ""
            
        }
        
        init( checkBox_Idinit :String, checkBox_Nameinit :String) {
            
            super.init()
            self.checkBox_Name = checkBox_Nameinit
        
            self.checkBox_Id = checkBox_Idinit
        
            
            
        }
        
        override var description: String
        {
            return "Check Box Name: \(checkBox_Name)" + "Check Box ID : \(checkBox_Id)"
        }
        
        
   

}
