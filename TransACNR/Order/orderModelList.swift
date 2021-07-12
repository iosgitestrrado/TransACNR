//
//  orderModelList.swift
//  TransACNR
//
//  Created by Monish M S on 09/08/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class orderModelList: NSObject {
    var Order_Customer_Name :String!
    var Order_AssignedTo_Name :String!
    var Order_Approval_Status :String!
    
    
    var Order_Order_Intend_No :String!
    var Order_CreatedDate :String!
    var Order_Cust_Code :String!
    var Order_Enquiry_Type :String!
    var Order_Unit_Model :String!
   var Order_List_Id :String!
    
     var Order_date :String!
     var Order_Total :String!
    var Order_Paid :String!
    
    
    
    override init() {
        super.init()
        
        self.Order_Customer_Name = ""
        self.Order_AssignedTo_Name = ""
        self.Order_Order_Intend_No = ""
        self.Order_CreatedDate = ""
        self.Order_Cust_Code = ""
        self.Order_Enquiry_Type = ""
        self.Order_Unit_Model = ""
        self.Order_List_Id = ""
        self.Order_Approval_Status = ""
        self.Order_date = ""
        self.Order_Total = ""
        self.Order_Paid = ""
    }
    
    init( Order_Customer_Nameinit :String, Order_AssignedTo_Nameinit :String,Order_Order_Intend_Noinit :String, Order_CreatedDateinit :String, Order_Cust_Codeinit :String, Order_Enquiry_Typeinit :String,Order_Unit_Modelinit :String, Order_List_Idinit :String, Order_Approval_Statusinit :String, Order_dateinit :String, Order_Totalinit :String, Order_Paidinit :String) {
        
        super.init()
        self.Order_Customer_Name = Order_Customer_Nameinit
        self.Order_AssignedTo_Name = Order_AssignedTo_Nameinit
        self.Order_Order_Intend_No = Order_Order_Intend_Noinit
        self.Order_CreatedDate = Order_CreatedDateinit
        self.Order_Cust_Code = Order_Cust_Codeinit
        self.Order_Enquiry_Type = Order_Enquiry_Typeinit
        self.Order_Unit_Model = Order_Unit_Modelinit
        self.Order_List_Id = Order_List_Idinit
        self.Order_Approval_Status = Order_Approval_Statusinit
        self.Order_date = Order_dateinit
         self.Order_Total = Order_Totalinit
        self.Order_Paid = Order_Paidinit
    }
    
    override var description: String
    {
        return  "Check Box ID : \(Order_Customer_Name)"
    }}
