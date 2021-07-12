//
//  SharedInstance.swift
//  Azool
//
//  Created by DON PAUL PM on 15/05/17.
//  Copyright © 2017 donpaulpm. All rights reserved.
//

import UIKit

class SharedInstance: NSObject {

static let sharedData = SharedInstance()

    var CustomerCodeID :String!
     var ServiceEnqNo :String!
     var dealing_PersonName :String!
    var cattleTypeName :String!
    var markrtTypeName :String!
    var complintTypeArray: [String] = []
    var Customer_DetailName :String!
    var Customer_DetailCode :String!
    var Customer_DetailId :String!
    var Customer_DetailAddress :String!
    var Customer_DetailMobile_No :String!
    var Customer_DetailRegistration_No :String!
    var Customer_DetailM_Model :String!
    var Customer_DetailSerialNumber :String!
    var Customer_DetailVehicle_Reg_Id :String!
    var Vehicle_Id :String!
    var Vehicle_No :String!
    
    
    var filterFromDate :String =  ""
    var filterToDate :String =  ""
    var filterCustomerName :String =  ""
    var filterJobCardNumber :String =  ""
    var filterVehiclenumber :String =  ""
    var filterUnitSerial :String =  ""
    
    
    func filterUpdate(filterFromDateInit :String,filterToDateInit :String,filterCustomerNameInit :String,filterJobCardNumberInit :String,filterVehiclenumberInit :String,filterUnitSerialInit :String){
      filterFromDate = ""
       filterToDate = ""
        filterCustomerName  = ""
        filterJobCardNumber  = ""
        filterVehiclenumber  = ""
         filterUnitSerial  = ""
        
        filterFromDate = filterFromDateInit
        filterToDate = filterToDateInit
        filterCustomerName  = filterCustomerNameInit
        filterJobCardNumber  = filterJobCardNumberInit
        filterVehiclenumber  = filterVehiclenumberInit
        filterUnitSerial  = filterUnitSerialInit
    }

    
    
    
    
    
    func VehicleIDUpdate(Vehicle_IdInit :String,Vehicle_NoInit :String){
        Vehicle_Id = ""
        Vehicle_No = ""
        
        Vehicle_Id = Vehicle_IdInit
        
        Vehicle_No = Vehicle_NoInit
    }


    func CustomerCodeIDUpdate(CustomerCodeIDInit :String,ServiceEnqNoInit :String){
        CustomerCodeID = ""
       ServiceEnqNo = ""
        
        CustomerCodeID = CustomerCodeIDInit
        
        ServiceEnqNo = ServiceEnqNoInit
    }
    func dealing_PersonNameUpdate(dealing_PersonNameInit :String){
        dealing_PersonName = ""
      
        
        dealing_PersonName = dealing_PersonNameInit
        
    }
    
    func   CustomerDetailsUpdate(Customer_DetailIdInit :String,Customer_DetailCodeInit :String,Customer_DetailNameInit :String,Customer_DetailAdreessInit :String,Customer_DetailmobileNoInit :String,Customer_DetailRegistration_NoInit :String,Customer_DetailM_ModelInit :String,Customer_DetailSerialNumberInit :String,Customer_DetailVehicle_Reg_IdInit :String){
 
        
        Customer_DetailName = ""
        Customer_DetailCode = ""
        Customer_DetailId = ""
        Customer_DetailAddress = ""
        Customer_DetailMobile_No = ""
        Customer_DetailRegistration_No = ""
        Customer_DetailM_Model = ""
        Customer_DetailSerialNumber = ""
        Customer_DetailVehicle_Reg_Id = ""
        
        
        Customer_DetailName = Customer_DetailNameInit
        Customer_DetailCode = Customer_DetailCodeInit
        Customer_DetailId = Customer_DetailIdInit
        Customer_DetailAddress = Customer_DetailAdreessInit
        Customer_DetailMobile_No = Customer_DetailmobileNoInit
        Customer_DetailRegistration_No = Customer_DetailRegistration_NoInit
        Customer_DetailM_Model = Customer_DetailM_ModelInit
        Customer_DetailSerialNumber = Customer_DetailSerialNumberInit
        Customer_DetailVehicle_Reg_Id = Customer_DetailVehicle_Reg_IdInit
        
        
        
        
        
        
    }
    func complaintType(dealing_PersonNameInit :[String]){
        complintTypeArray.removeAll()
        
        
        complintTypeArray = dealing_PersonNameInit
        
    }
    
    
    
    
    func CustomerResetValues(){
        
     
        Customer_DetailName = ""
        Customer_DetailCode = ""
        Customer_DetailId = ""
        Customer_DetailAddress = ""
        Customer_DetailMobile_No = ""
        Customer_DetailRegistration_No = ""
        Customer_DetailM_Model = ""
        Customer_DetailSerialNumber = ""
        Customer_DetailVehicle_Reg_Id = ""
        CustomerCodeID = ""
        ServiceEnqNo = ""
        dealing_PersonName = ""
        complintTypeArray.removeAll()
    }
    
    
   
    
}
