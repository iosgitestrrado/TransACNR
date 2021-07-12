//
//  DetailModel.swift
//  TransACNR
//
//  Created by Monish M S on 28/05/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class DetailModel: NSObject {
    var detailJobcardNumber :String!
    var detailServiceEnquiry :String!
    var detailCustomerName :String!
    var detailTypeofService :String!
    var detailAssignedTo :String!
    var detailCustomerStatus :String!
    var detailActiveStatus :String!
    var detailComplaintType :String!
    var detailCustomerCode :String!
    var detailCustomerAddress :String!
    var detailMobileNumber :String!
    var detailUnitModel :String!
    var detailSerialNumber :String!
    var detailEngineHour :String!
    var detailPlaceAttended :String!
    var detailEntryTime :String!
    var detailDetailsofJob :String!
    var detailContactPerson :String!
    var detailRemarks :String!
   var Service_Id :String!
    
    
    
    
    
    
    
    override init() {
        super.init()
        
        
        
        self.detailJobcardNumber = ""
        self.detailServiceEnquiry = ""
        self.detailCustomerName = ""
        self.detailTypeofService = ""
        self.detailAssignedTo = ""
        self.detailCustomerStatus = ""
        self.detailActiveStatus = ""
        self.detailComplaintType = ""
        self.detailCustomerCode = ""
        self.detailCustomerAddress = ""
        self.detailMobileNumber = ""
        self.detailUnitModel = ""
        self.detailSerialNumber = ""
        self.detailEngineHour = ""
        self.detailPlaceAttended = ""
        self.detailEntryTime = ""
        self.detailDetailsofJob = ""
        self.detailContactPerson = ""
        self.detailRemarks = ""
        
        self.Service_Id = ""
        
        
        
        
        
    }
    
    init( detailService_Idinit :String,detailJobcardNumberinit :String, detailServiceEnquiryinit :String,detailCustomerNameinit :String, detailTypeofServiceinit :String,detailAssignedToinit :String, detailCustomerStatusinit :String,detailActiveStatusinit :String, detailComplaintTypeinit :String,detailCustomerCodeinit :String, detailCustomerAddressinit :String,detailMobileNumberinit :String, detailUnitModelinit :String,detailSerialNumberinit :String, detailEngineHourinit :String,detailPlaceAttendedinit :String, detailEntryTimeinit :String,detailDetailsofJobinit :String, detailContactPersoninit :String, detailRemarksinit :String) {
        
        super.init()
        self.Service_Id = detailService_Idinit
        
        
        self.detailJobcardNumber = detailJobcardNumberinit
        self.detailServiceEnquiry = detailServiceEnquiryinit
        self.detailCustomerName = detailCustomerNameinit
        self.detailTypeofService = detailTypeofServiceinit
        self.detailAssignedTo = detailAssignedToinit
        self.detailCustomerStatus = detailCustomerStatusinit
        self.detailActiveStatus = detailActiveStatusinit
        self.detailComplaintType = detailComplaintTypeinit
        self.detailCustomerCode = detailCustomerCodeinit
        self.detailCustomerAddress = detailCustomerAddressinit
        self.detailMobileNumber = detailMobileNumberinit
        self.detailUnitModel = detailUnitModelinit
        self.detailSerialNumber = detailSerialNumberinit
        self.detailEngineHour = detailEngineHourinit
        self.detailPlaceAttended = detailPlaceAttendedinit
        self.detailEntryTime = detailEntryTimeinit
        self.detailDetailsofJob = detailDetailsofJobinit
        self.detailRemarks = detailRemarksinit
        self.detailContactPerson = detailContactPersoninit
        
        
        
        
        
    }




}
