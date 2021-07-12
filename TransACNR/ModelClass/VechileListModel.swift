//
//  VechileListModel.swift
//  TransACNR
//
//  Created by Monish M S on 17/05/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class VechileListModel: NSObject {

    var Service_Customer_Name :String!
    var Service_AssignedTo_Name :String!
     var Service_CustomStatus :String!
      var Service_EnquiryNo :String!
    
    
    override init() {
        super.init()
        
        self.Service_Customer_Name = ""
        self.Service_AssignedTo_Name = ""
        
        self.Service_CustomStatus = ""
        self.Service_EnquiryNo = ""
        
    }
    
    init( Service_Customer_Nameinit :String, Service_AssignedTo_Nameinit :String,Service_CustomStatusinit :String, Service_EnquiryNoinit :String) {
        
        super.init()
        self.Service_EnquiryNo = Service_EnquiryNoinit
        
        self.Service_Customer_Name = Service_Customer_Nameinit
        self.Service_AssignedTo_Name = Service_AssignedTo_Nameinit
        
        self.Service_CustomStatus = Service_CustomStatusinit
        
    }
    
    override var description: String
    {
        return  "Check Box ID : \(Service_Customer_Name)"
    }
}
