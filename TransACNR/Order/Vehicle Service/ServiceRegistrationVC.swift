//
//  ServiceRegistrationVC.swift
//  TransACNR
//
//  Created by Monish M S on 27/04/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Toast_Swift
import DropDown



class ServiceRegistrationVC: UIViewController,GetResultResponse,UITextFieldDelegate,complientAddDelegate {

     let functionCall = GetRespone()
    let serviceTypeDrop = DropDown()
    let serviceAccedentTypeDrop = DropDown()
    
    
    let customerNameDrop = DropDown()
    let serialNumberDrop = DropDown()
     let vehicleNumberDrop = DropDown()
    @IBOutlet weak var mainviewHeight: NSLayoutConstraint!
    @IBOutlet weak var hiddenviewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var namewidth: NSLayoutConstraint!
    @IBOutlet weak var addreesWidth: NSLayoutConstraint!
    
     var menuListPass   =  [checkBoxModel]()
    
    var seguefromModel :DetailModel = DetailModel()
    var callback :Bool = false
    var callautofillName :Bool = false
    var callautofillVehicle :Bool = false
    var callautofillserial :Bool = false
    var callReCall :Bool = false
    var saveData :Bool = false
    var callautofillVehicleNoCustomer :Bool = false
    
    
    
    var displayNameArray : [String] = []
     var displayNamedictArray : [NSDictionary] = []
    
    
    
    
    
    @IBOutlet weak var regNoTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var customerCodeTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var branchTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var customerNameTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var vehicleNumberTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var unitSerialNoTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var mobileNoTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var contactPersonTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var customerAddressTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var dateTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var serviceTypeTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var unitModelTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var engineHourTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var placeAttentedTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var entrytimeTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var serviceAccientTypeTxtFd: SkyFloatingLabelTextField!
    
    
    
    
    @IBOutlet weak var detailJob: FloatLabelTextView!
    @IBOutlet weak var complaintTypeTxtFd: SkyFloatingLabelTextField!

  
    
    @IBOutlet weak var remarksData: FloatLabelTextView!
    var complintDisplayArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       newSharedInstance.CustomerResetValues()
        
       hiddenviewHeight.constant = 0
        mainviewHeight.constant = 1150
        serviceCall()
        namewidth.constant = self.view.frame.size.width - 40
        addreesWidth.constant = self.view.frame.size.width - 40
        vehicleNumberDrop.bottomOffset = CGPoint(x: 5, y:(vehicleNumberTxtFd?.frame.height)!)
        vehicleNumberDrop.anchorView = vehicleNumberTxtFd
        vehicleNumberDrop.direction = .any
        vehicleNumberDrop.width = vehicleNumberTxtFd?.frame.width
        
        
        
        
        vehicleNumberDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.vehicleNumberNameOn(index: index, item: item)
        }
        
        
        
        
      
        
        customerNameDrop.bottomOffset = CGPoint(x: 5, y:(customerNameTxtFd?.frame.height)!)
        customerNameDrop.anchorView = customerNameTxtFd
        customerNameDrop.direction = .any
        customerNameDrop.width = customerNameTxtFd?.frame.width
        
        
        
        
        customerNameDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.customerNameOn(index: index, item: item)
        }
        
        serialNumberDrop.bottomOffset = CGPoint(x: 5, y:(unitSerialNoTxtFd?.frame.height)!)
        serialNumberDrop.anchorView = unitSerialNoTxtFd
        serialNumberDrop.direction = .any
        serialNumberDrop.width = unitSerialNoTxtFd?.frame.width
        
        
        
        
        serialNumberDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.serialNumberNameOn(index: index, item: item)
        }
        
        
        
        
        
        
        
        
        
       
            serviceTypeDrop.bottomOffset = CGPoint(x: 5, y: (serviceTypeTxtFd?.frame.height)!)
            serviceTypeDrop.anchorView = serviceTypeTxtFd
            serviceTypeDrop.direction = .any
            serviceTypeDrop.width = serviceTypeTxtFd?.frame.width
        
            serviceTypeDrop.dataSource = ["On Road Break Down","Service Break Down","General Service","Accident Service"]
            
            
            serviceTypeDrop.selectionAction = { [unowned self] (index: Int, item: String) in
                self.serviceTypeNameOn(index: index, item: item)
            }
        
        serviceAccedentTypeDrop.bottomOffset = CGPoint(x: 5, y: (serviceTypeTxtFd?.frame.height)!)
        serviceAccedentTypeDrop.anchorView = serviceTypeTxtFd
        serviceAccedentTypeDrop.direction = .any
        serviceAccedentTypeDrop.width = serviceTypeTxtFd?.frame.width
        
        serviceAccedentTypeDrop.dataSource = ["New AC installation","AC removal","Repair"]
        
        
        serviceAccedentTypeDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.serviceTypeAccidentNameOn(index: index, item: item)
        }
        
        
        
        
        
        
     
            let datePickerView = UIDatePicker()
            datePickerView.datePickerMode = .date
            dateTxtFd.inputView = datePickerView
            datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        
        let datePickerView1 = UIDatePicker()
        datePickerView1.datePickerMode = .time
        entrytimeTxtFd.inputView = datePickerView1
        datePickerView1.addTarget(self, action: #selector(handleTimePicker(sender:)), for: .valueChanged)
        
        
        }
        
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateTxtFd.text = dateFormatter.string(from: sender.date)
    }
    
    
    @objc func handleTimePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        entrytimeTxtFd.text = dateFormatter.string(from: sender.date)
    }
      
        
        
        
  
    func serviceTypeAccidentNameOn(index: Int, item: String){
        
        
        
        serviceAccientTypeTxtFd?.text = item
        
        
    }






    func serviceTypeNameOn(index: Int, item: String){
        
   
        
        serviceTypeTxtFd?.text = item
        
        
        if item == "Accident Service" {
            hiddenviewHeight.constant = 50
            mainviewHeight.constant = 1200
            
        }else{
            hiddenviewHeight.constant = 0
            mainviewHeight.constant = 1150
            
        }
        
        
    }
    
    func serviceCallTable(stringData:String)  {
        
        functionCall.delegete = self
        callautofillVehicleNoCustomer = true
        functionCall.getserviceCall(param: ServiceCallRepresenationVehicle(stringData: stringData), tpye: TransACNRBaseTestUrl+TransACNRGetVehicleOwnerShipSearching as NSString)
        
        
        
        
        
        
    }
    
    
    
    
    
    
    func vehicleNumberNameOn(index: Int, item: String){
        
        vehicleNumberTxtFd.resignFirstResponder()
        
        vehicleNumberTxtFd?.text = item
        
        
        
         if  (customerNameTxtFd.text?.characters.count)! > 1 {
        
        
        for itemValue in displayNamedictArray {
            let obj = itemValue as NSDictionary
            let name = obj.object(forKey: "Registration_No") as! String
            
            
            if name == item {
                
                
                let Customer_Id : Int = obj.object(forKey: "Customer_Id")as? Int ?? 0
                let stringCustomer_Id = "\(Customer_Id)"
                let Vehicle_Reg_Id : Int = obj.object(forKey: "Vehicle_Reg_Id")as? Int ?? 0
                let stringVehicle_Reg_Id = "\(Vehicle_Reg_Id)"
                
                newSharedInstance.CustomerDetailsUpdate(Customer_DetailIdInit: stringCustomer_Id , Customer_DetailCodeInit: obj.object(forKey: "Customer_Code") as? String ?? "", Customer_DetailNameInit: obj.object(forKey: "Customer_Name") as? String ?? "", Customer_DetailAdreessInit: obj.object(forKey: "Customer_Address") as? String ?? "", Customer_DetailmobileNoInit: obj.object(forKey: "Mobile_No")as? String ?? "", Customer_DetailRegistration_NoInit: obj.object(forKey: "Registration_No")as? String ?? "", Customer_DetailM_ModelInit: obj.object(forKey: "M_Model")as? String ?? "", Customer_DetailSerialNumberInit: obj.object(forKey: "SerialNumber")as? String ?? "", Customer_DetailVehicle_Reg_IdInit: stringVehicle_Reg_Id)
                
                
                
                customerNameTxtFd.text = obj.object(forKey: "Customer_Name") as? String ?? ""
                
                mobileNoTxtFd.text = obj.object(forKey: "Mobile_No")as? String ?? ""
                
                customerCodeTxtFd.text = obj.object(forKey: "Customer_Code") as? String ?? ""
                
                
                
                
                
                
                let stringValue1  = obj.object(forKey: "Customer_Address") as? String ?? ""
                
                let valueTechHeight1 =  stringValue1.width(withConstrainedHeight:30 , font: UIFont.systemFont(ofSize: 14, weight:.regular))
                
                if valueTechHeight1  > self.view.frame.size.width - 60{
                    
                    addreesWidth.constant = valueTechHeight1
                    
                    
                }else{
                    
                    addreesWidth.constant = self.view.frame.size.width - 40
                }
                
                
                customerAddressTxtFd.text = stringValue1
               
                
                vehicleNumberTxtFd.text = obj.object(forKey: "Registration_No") as? String ?? ""
                unitSerialNoTxtFd.text = obj.object(forKey: "SerialNumber") as? String ?? ""
                
                
                
                
            }
        }
        
         }else{
            
            for itemValue in displayNamedictArray {
                let obj = itemValue as NSDictionary
                let name = obj.object(forKey: "Registration_No") as! String
                
                
                if name == item {
                    
                    
                    let Customer_Id : Int = obj.object(forKey: "Vehicle_Reg_Id")as? Int ?? 0
                    
                    
                    serviceCallTable(stringData: "\(Customer_Id)")
                    
                    
                    
                    
                }
            }
            
            
        }
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    func serialNumberNameOn(index: Int, item: String){
        
        unitSerialNoTxtFd.resignFirstResponder()
        
        unitSerialNoTxtFd?.text = item
    
        for itemValue in displayNamedictArray {
            let obj = itemValue as NSDictionary
            let name = obj.object(forKey: "SerialNumber") as! String
            
            
            if name == item {
                
                
                let Customer_Id : Int = obj.object(forKey: "Customer_Id")as? Int ?? 0
                let stringCustomer_Id = "\(Customer_Id)"
                let Vehicle_Reg_Id : Int = obj.object(forKey: "Vehicle_Reg_Id")as? Int ?? 0
                let stringVehicle_Reg_Id = "\(Vehicle_Reg_Id)"
                
                
                
                
                
                newSharedInstance.CustomerDetailsUpdate(Customer_DetailIdInit: stringCustomer_Id , Customer_DetailCodeInit: obj.object(forKey: "Customer_Code") as? String ?? "", Customer_DetailNameInit: obj.object(forKey: "Customer_Name") as? String ?? "", Customer_DetailAdreessInit: obj.object(forKey: "Customer_Address") as? String ?? "", Customer_DetailmobileNoInit: obj.object(forKey: "Mobile_No")as? String ?? "", Customer_DetailRegistration_NoInit: obj.object(forKey: "Registration_No")as? String ?? "", Customer_DetailM_ModelInit: obj.object(forKey: "M_Model")as? String ?? "", Customer_DetailSerialNumberInit: obj.object(forKey: "SerialNumber")as? String ?? "", Customer_DetailVehicle_Reg_IdInit: stringVehicle_Reg_Id)
                
                
                
                customerNameTxtFd.text = obj.object(forKey: "Customer_Name") as? String ?? ""
                customerCodeTxtFd.text = obj.object(forKey: "Customer_Code") as? String ?? ""
                mobileNoTxtFd.text = obj.object(forKey: "Mobile_No")as? String ?? ""
                
                unitModelTxtFd.text = obj.object(forKey: "M_Model")as? String ?? ""
                let stringValue1  = obj.object(forKey: "Customer_Address") as? String ?? ""
                
                let valueTechHeight1 =  stringValue1.width(withConstrainedHeight:30 , font: UIFont.systemFont(ofSize: 14, weight:.regular))
                
                if valueTechHeight1  > self.view.frame.size.width - 60{
                    
                    addreesWidth.constant = valueTechHeight1
                    
                    
                }else{
                    
                    addreesWidth.constant = self.view.frame.size.width - 40
                }
                
                
                customerAddressTxtFd.text = stringValue1
                
                vehicleNumberTxtFd.text = obj.object(forKey: "Registration_No") as? String ?? ""
                unitSerialNoTxtFd.text = obj.object(forKey: "SerialNumber") as? String ?? ""
                
                
                
                
            }
        }
        
        
        
        
        
        
        
        
        
        
    
    }
    
    
    func customerNameOn(index: Int, item: String){
        
        customerNameTxtFd.resignFirstResponder()
        
        customerNameTxtFd?.text = item
        vehicleNumberTxtFd?.text = ""
        unitSerialNoTxtFd?.text = ""
        
        
        
        for itemValue in displayNamedictArray {
            let obj = itemValue as NSDictionary
            let name = obj.object(forKey: "Customer_Name") as! String
            
            
            if name == item {
                
                
                let Customer_Id : Int = obj.object(forKey: "Customer_Id")as? Int ?? 0
                let stringCustomer_Id = "\(Customer_Id)"
                
                
                newSharedInstance.CustomerDetailsUpdate(Customer_DetailIdInit: stringCustomer_Id , Customer_DetailCodeInit: obj.object(forKey: "Customer_Code") as? String ?? "", Customer_DetailNameInit: obj.object(forKey: "Customer_Name") as? String ?? "", Customer_DetailAdreessInit: obj.object(forKey: "Customer_Address") as? String ?? "", Customer_DetailmobileNoInit: obj.object(forKey: "Mobile_No")as? String ?? "", Customer_DetailRegistration_NoInit: "", Customer_DetailM_ModelInit:obj.object(forKey: "M_Model") as? String ?? "", Customer_DetailSerialNumberInit: "", Customer_DetailVehicle_Reg_IdInit: "")
                
                
                
                customerNameTxtFd.text = obj.object(forKey: "Customer_Name") as? String ?? ""
                customerCodeTxtFd.text = obj.object(forKey: "Customer_Code") as? String ?? ""
               unitModelTxtFd.text = obj.object(forKey: "M_Model")as? String ?? ""
                mobileNoTxtFd.text = obj.object(forKey: "Mobile_No")as? String ?? ""
                let stringValue1  = obj.object(forKey: "Customer_Address") as? String ?? ""
                
                let valueTechHeight1 =  stringValue1.width(withConstrainedHeight:30 , font: UIFont.systemFont(ofSize: 14, weight:.regular))
                
                if valueTechHeight1  > self.view.frame.size.width - 60{
                    
                    addreesWidth.constant = valueTechHeight1
                    
                    
                }else{
                    
                    addreesWidth.constant = self.view.frame.size.width - 40
                }
                
                
                customerAddressTxtFd.text = stringValue1
                
            }
        }
        
        
        
        
        
        
        

        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
         setupUI()
    }
    
    
    func setupUI()  {
      regNoTxtFd.text = newSharedInstance.ServiceEnqNo
      customerCodeTxtFd.text = newSharedInstance.CustomerCodeID
      branchTxtFd.text = userDefaults.GET_USERDEFAULTS(objectValue:"BranchName")
     
        
        if let string = dateTxtFd.text, !string.isEmpty {
            
        }else{
            
            dateTxtFd.text = HelperClass.datefromString(dateString:NSDate() as Date, typeofFormatting: "MM/dd/yyyy")
        }
        
        
        
        
        
        
        
        var Customer_DetailName:String = ""
        if let string = newSharedInstance.Customer_DetailName, !string.isEmpty {
            Customer_DetailName =  string
        }
        
        
        
        
        
        var Customer_DetailVehicleId:String = ""
        
        if let string = newSharedInstance.Vehicle_No, !string.isEmpty {
            Customer_DetailVehicleId =  string
        }
        
        
        if let string = newSharedInstance.Customer_DetailVehicle_Reg_Id, !string.isEmpty {
            
            if  string != "0"{
            Customer_DetailVehicleId =  string
            }
        }
        
        var Customer_DetailSerialNumber:String = ""
        if let string = newSharedInstance.Customer_DetailSerialNumber, !string.isEmpty {
            
             if  string != "0"{
            Customer_DetailSerialNumber =  string
            }
        }
        var CustomerMobile:String = ""
        if let string = newSharedInstance.Customer_DetailMobile_No, !string.isEmpty {
            
             if  string != "0"{
            CustomerMobile =  string
            }
        }
        var CustomerAddress:String = ""
        if let string = newSharedInstance.Customer_DetailAddress, !newSharedInstance.Customer_DetailAddress.isEmpty {
            CustomerAddress =  string
        }
        
        
        
     customerNameTxtFd.text = Customer_DetailName
     vehicleNumberTxtFd.text = Customer_DetailVehicleId
     unitSerialNoTxtFd.text = Customer_DetailSerialNumber
     mobileNoTxtFd.text = CustomerMobile
        
        
        
        
        
    
        
        let valueTechHeight1 =  CustomerAddress.width(withConstrainedHeight:30 , font: UIFont.systemFont(ofSize: 14, weight:.regular))
        
        if valueTechHeight1  > self.view.frame.size.width - 60{
            
            addreesWidth.constant = valueTechHeight1
            
            
        }else{
            
            addreesWidth.constant = self.view.frame.size.width - 40
        }
        
        
   
     customerAddressTxtFd.text = CustomerAddress
        
 
        if seguefromModel.detailCustomerName != "" {
            
            
            customerNameTxtFd.text = seguefromModel.detailCustomerName
            vehicleNumberTxtFd.text = seguefromModel.detailActiveStatus
            unitSerialNoTxtFd.text = seguefromModel.detailSerialNumber
            mobileNoTxtFd.text = seguefromModel.detailMobileNumber
            contactPersonTxtFd.text = seguefromModel.detailContactPerson
            customerAddressTxtFd.text = seguefromModel.detailCustomerAddress
            
            let valueTechHeight1 =  seguefromModel.detailCustomerAddress.width(withConstrainedHeight:30 , font: UIFont.systemFont(ofSize: 14, weight:.regular))
            
            if valueTechHeight1  > self.view.frame.size.width - 60{
                
                addreesWidth.constant = valueTechHeight1
                
                
            }else{
                
                addreesWidth.constant = self.view.frame.size.width - 40
            }
            
            
            
            
            
            serviceTypeTxtFd.text = seguefromModel.detailTypeofService
            unitModelTxtFd.text = seguefromModel.detailUnitModel
            engineHourTxtFd.text = seguefromModel.detailEngineHour
            placeAttentedTxtFd.text = seguefromModel.detailPlaceAttended
            entrytimeTxtFd.text = seguefromModel.detailEntryTime
            
            complaintTypeTxtFd.text = seguefromModel.detailComplaintType
            detailJob.text = seguefromModel.detailDetailsofJob
            remarksData.text = seguefromModel.detailRemarks
            
           
            
        }
        
    }
    
    
    func serviceCallback()  {
         callback = true
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNREditOrViewServiceEnquiry as NSString)
    }
    
    func serviceCallAutocall(passText : String)  {
        callautofillName = true
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceAutoCallRepresenation(stringData: passText), tpye: TransACNRBaseTestUrl+TransACNRAutoCompleteByCustomer as NSString)
    }
    func serviceCallAutocallserial(passText : String)  {
        callautofillserial = true
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceAutoCallRepresenationSerial(stringData: passText), tpye: TransACNRBaseTestUrl+TransACNRAutoCompleteBySerialNumber as NSString)
    }
    
    
    
    func serviceCallAutocallvehicle(passText : String)  {
        callautofillVehicle = true
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceAutoCallRepresenationVehicle(stringData: passText), tpye: TransACNRBaseTestUrl+TransACNRAutoCompleteByVehicleNumber as NSString)
    }
    
    
    
    
    func serviceCallAutocallvehicleNoId(passText : String)  {
        
        functionCall.delegete = self
          callautofillVehicle = true
        functionCall.getserviceCall(param: VechileListServiceCallRepresenation(stringData: passText), tpye: TransACNRBaseTestUrl+TransACNRNumberForVehicleOwnerShip as NSString)
        
        
        
        
        
        
    }
    
    
    
    
    
    func serviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: [:], tpye: TransACNRBaseTestUrl+TransACNRServiceReg as NSString)
    }
    
    func serviceReCall()  {
        
        
        
    callReCall = true
    callback = false
    callautofillName  = false
    callautofillVehicle = false
    callautofillserial  = false
      
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: [:], tpye: TransACNRBaseTestUrl+TransACNRServiceReg as NSString)
    }
    
    
    
    func GetServiceRespone(param: NSDictionary) {
        
        
        if param.count == 1 {
            _ = navigationController?.popViewController(animated: true)
            
        }else{
        
        if let value = param["returnId"] {
         _ = navigationController?.popViewController(animated: true)
        }else{
        
        
        
        
        
        
        if callback {
            
            
            
            
            
            
            if let value = param["ComplaintTypeList"] {
                newSharedInstance.complintTypeArray.removeAll()
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    let Complaint_Type_Id : Int = obj.object(forKey: "Complaint_Type_Id")as? Int ?? 0
                 //   let stringComplaint_Type_Id = "\(Complaint_Type_Id)"
            newSharedInstance.complintTypeArray.append("\(Complaint_Type_Id)")
                }
                
                
            }
            
            
            
            
            if let value = param["ServiceDetaills"] {
                
                let objPASS = value as! NSArray
                
                
                let obj = objPASS[0] as! NSDictionary
                regNoTxtFd.text = obj .object(forKey: "ServiceEnquiryNo") as? String ?? ""
                
                
                let Customer_Id : Int = obj.object(forKey: "Customer_Id")as? Int ?? 0
                let stringCustomer_Id = "\(Customer_Id)"
                let Vehicle_Reg_Id : Int = obj.object(forKey: "Vehicle_Reg_Id")as? Int ?? 0
                let stringVehicle_Reg_Id = "\(Vehicle_Reg_Id)"
                let Service_Id : Int = obj.object(forKey: "Service_Id")as? Int ?? 0
                let stringService_Id = "\(Service_Id)"
                
                
                
                newSharedInstance.CustomerDetailsUpdate(Customer_DetailIdInit: stringCustomer_Id , Customer_DetailCodeInit: obj.object(forKey: "Customer_Code") as? String ?? "", Customer_DetailNameInit: obj.object(forKey: "Customer_Name") as? String ?? "", Customer_DetailAdreessInit: obj.object(forKey: "Customer_Address") as? String ?? "", Customer_DetailmobileNoInit: obj.object(forKey: "Mobile_No")as? String ?? "", Customer_DetailRegistration_NoInit: obj.object(forKey: "Registration_No")as? String ?? "", Customer_DetailM_ModelInit: stringService_Id, Customer_DetailSerialNumberInit: obj.object(forKey: "SerialNumber")as? String ?? "", Customer_DetailVehicle_Reg_IdInit: stringVehicle_Reg_Id)
                
                
                
                
                
                
                
                
                
             customerCodeTxtFd.text = obj .object(forKey: "Customer_Code") as? String ?? ""
            customerNameTxtFd.text = obj .object(forKey: "Customer_Name") as? String ?? ""
            vehicleNumberTxtFd.text = obj .object(forKey: "Registration_No") as? String ?? ""
            unitSerialNoTxtFd.text = obj .object(forKey: "Serial_Number") as? String ?? ""
            mobileNoTxtFd.text = obj .object(forKey: "Contact_Details") as? String ?? ""
            contactPersonTxtFd.text = obj .object(forKey: "ContactPerson") as? String ?? ""
            
                
            
                
                
                
                
                
                
                
                let stringValue1  = obj.object(forKey: "Customer_Address") as? String ?? ""
                
                let valueTechHeight1 =  stringValue1.width(withConstrainedHeight:30 , font: UIFont.systemFont(ofSize: 14, weight:.regular))
                
                if valueTechHeight1  > self.view.frame.size.width - 60{
                    
                    addreesWidth.constant = valueTechHeight1
                    
                    
                }else{
                    
                    addreesWidth.constant = self.view.frame.size.width - 40
                }
                
                
                customerAddressTxtFd.text = stringValue1
                
                
                
                
                
                
                
                
                
            
            serviceTypeTxtFd.text = obj .object(forKey: "Type_of_Service") as? String ?? ""
                
                serviceAccientTypeTxtFd.text = obj .object(forKey: "Type_Of_Accedent_Service") as? String ?? ""
                if serviceTypeTxtFd.text == "Accident Service" {
                    hiddenviewHeight.constant = 50
                    mainviewHeight.constant = 1200
                    
                }else{
                    hiddenviewHeight.constant = 0
                    mainviewHeight.constant = 1150
                    
                }
                
                
            unitModelTxtFd.text = obj .object(forKey: "Unit_Model") as? String ?? ""
            engineHourTxtFd.text = obj .object(forKey: "Engine_Hour") as? String ?? ""
            placeAttentedTxtFd.text = obj .object(forKey: "Place_Attended") as? String ?? ""
            entrytimeTxtFd.text = obj .object(forKey: "Entry_time") as? String ?? ""
           
            detailJob.text = obj .object(forKey: "Details_of_Job") as? String ?? ""
            remarksData.text = obj .object(forKey: "Remarks") as? String ?? ""
            
            
            
 
            }
            callback = false
            
        }
        else if saveData{
        saveData = false
        }
        
        else if callReCall{
            
            
            
             newSharedInstance.CustomerCodeIDUpdate(CustomerCodeIDInit: param.object(forKey: "CustomerCode") as! String, ServiceEnqNoInit: param.object(forKey: "ServiceEnqNo") as! String)
            regNoTxtFd.text = newSharedInstance.ServiceEnqNo
            customerCodeTxtFd.text = newSharedInstance.CustomerCodeID
            callReCall = false
            
        }
        
        
        
        
        
        
        
        
        
        else if callautofillName {
            if let value = param["CustomerAutoComplete"] {
                
                displayNamedictArray.removeAll()
                displayNameArray.removeAll()
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    displayNamedictArray.append(obj)
                    displayNameArray.append(obj.object(forKey: "Customer_Name") as! String)
                    
                }
                }
                
            if displayNameArray.count > 0{
                
                customerNameDrop.dataSource = displayNameArray
                customerNameDrop.show()
                
            }
            
            callautofillName = false
        }
      else if callautofillVehicleNoCustomer {
            if let value = param["VehicleOwnerShipSearching"] {
                
                
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    print(obj)
                    
                    customerNameTxtFd.text = obj.object(forKey: "Customer_Name") as? String ?? ""
                    
                    
                    
                    
                   // serviceCallAutocall(passText: obj.object(forKey: "Customer_Name") as! String)
                    break
                    
                }
                
                
                
            }
        }
            
        else if callautofillVehicle {
            
            
          
            
            
            
            
            
            
            
            
            
            
            if let value = param["VehicleAutoComplete"] {
                
                displayNamedictArray.removeAll()
                displayNameArray.removeAll()
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    displayNamedictArray.append(obj)
                    displayNameArray.append(obj.object(forKey: "Registration_No") as! String)
                    
                }
            }
            
            if displayNameArray.count > 0{
                
                vehicleNumberDrop.dataSource = displayNameArray
                vehicleNumberDrop.show()
                
            }
            
            callautofillVehicle = false
        }
        else if callautofillserial {
            if let value = param["SerialNumAutoComplete"] {
                
                
                displayNamedictArray.removeAll()
                displayNameArray.removeAll()
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    displayNamedictArray.append(obj)
                    displayNameArray.append(obj.object(forKey: "SerialNumber") as! String)
                    
                }
            }
            
            if displayNameArray.count > 0{
                
                serialNumberDrop.dataSource = displayNameArray
                serialNumberDrop.show()
                
            }
            
            callautofillserial = false
        }
        
        else{
     
        if let value = param["ComplaintTypeList"] {
            
           
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                let Complaint_Type_Id : Int = obj.object(forKey: "Complaint_Type_Id")as? Int ?? 0
                let stringComplaint_Type_Id = "\(Complaint_Type_Id)"
                
              
                
                
                
                
                
                let menumodel = checkBoxModel(checkBox_Idinit: stringComplaint_Type_Id, checkBox_Nameinit: obj["ComplaintType"] as? String ?? "")
                
                
                menuListPass.append(menumodel)
                
                
                
                
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        newSharedInstance.CustomerCodeIDUpdate(CustomerCodeIDInit: param.object(forKey: "CustomerCode") as! String, ServiceEnqNoInit: param.object(forKey: "ServiceEnqNo") as! String)
        setupUI()
              if seguefromModel.detailCustomerName != "" {
                
                serviceCallback()
            }
            }}}
    }
    
    @IBAction func backNavigationAction(_ sender: Any) {
        
        
        
        
        _ = navigationController?.popViewController(animated: true)
        
        
    }
    @IBAction func addcustomerAction(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "AddPerson", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addPersonVC") as! AddPersonVC
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @IBAction func saveData(_ sender: Any) {
        
        if HelperClass.TEXTFIELDIsEmpty(value: customerNameTxtFd!) {
            
            Utilities.AlertActionDone(Title: "", Message: TAREMPTYCustomerName, ButtonText: TARDone,  setView:self.view)
            
            
        }else if HelperClass.TEXTFIELDIsEmpty(value: vehicleNumberTxtFd!){
            
            Utilities.AlertActionDone(Title: "", Message: TARINCORRECTVEHICLENumber, ButtonText: TARDone,  setView:self.view)
            
        }
        else if HelperClass.TEXTFIELDIsEmpty(value: mobileNoTxtFd!){
            
            Utilities.AlertActionDone(Title: "", Message: TAREMPTYMobileNumber, ButtonText: TARDone,  setView:self.view)
            
        }else if HelperClass.TEXTFIELDIsEmpty(value: serviceTypeTxtFd!){
            
            Utilities.AlertActionDone(Title: "", Message: TAREMPTYSERVICETYPE, ButtonText: TARDone,  setView:self.view)
            
        }else if HelperClass.TEXTVIEWEmpty(value: remarksData!){
            
            Utilities.AlertActionDone(Title: "", Message: TAREMPTYREMARKS, ButtonText: TARDone,  setView:self.view)
            
        }
        
        else{
             if seguefromModel.detailCustomerName != "" {
                functionCall.delegete = self
                saveData =  true
                functionCall.getserviceCall(param: ServiceCallRepresenationUpdate(), tpye: TransACNRBaseTestUrl+TransUpdateServiceEnquiry as NSString)
                
                
             }else{
            serviceReCall()
            
            functionCall.delegete = self
            saveData =  true
            functionCall.getserviceCall(param: ServiceCallRepresenationSave(), tpye: TransACNRBaseTestUrl+TransSaveServiceEnquiry as NSString)
            }
        }
   

        
     
    }
    
    @IBAction func serviceTypeAction(_ sender: Any) {
        
        
        serviceTypeDrop.show()
    }
    @IBAction func serviceAccidentTypeAction(_ sender: Any) {
        
        
        serviceAccedentTypeDrop.show()
    }
    
    
    
    @IBAction func complintTypeAction(_ sender: Any) {
        
        
       
            
        let popOverVC = UIStoryboard(name: "Checkbox", bundle: nil).instantiateViewController(withIdentifier: "checkboxVC") as! CheckboxVC
        popOverVC.menuListdisplay = menuListPass
        popOverVC.delegateAdd = self
        self.addChildViewController(popOverVC)
        
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
       
        
     
        
    }
    func complientreloaded(){
        
        if newSharedInstance.complintTypeArray.count > 0 {
            complintDisplayArray.removeAll()

            for item in menuListPass {
                
                
                
                if newSharedInstance.complintTypeArray.contains(item.checkBox_Id)  {
                    
                    complintDisplayArray.append(item.checkBox_Name)
                    
                }
                
            }
            
            complaintTypeTxtFd.text = complintDisplayArray.joined(separator: ",")
        
            
            let valueTechHeight =  complaintTypeTxtFd.text!.width(withConstrainedHeight:30 , font: UIFont.systemFont(ofSize: 14, weight:.regular))
            
            
            
            
            
            
            
           
            
            if valueTechHeight  > self.view.frame.size.width - 60{
                
                namewidth.constant = valueTechHeight
                
                
            }else{
                
                namewidth.constant = self.view.frame.size.width - 40
            }
           
            
            
        }
    }
    
    
//
    
    
    
    
    
    
   
    @IBAction func saveRegistrationAction(_ sender: Any) {
    
    
    
    
    
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func addVehicleAction(_ sender: Any) {
        
        
        
        
        
        
        
        
        
        
        if !((customerNameTxtFd.text?.isEmpty)!) {
        
            
            
            let popOverVC = UIStoryboard(name: "AddNewVechicle", bundle: nil).instantiateViewController(withIdentifier: "addVehicleVC") as! AddVehicleVC
            
            self.addChildViewController(popOverVC)
            
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
            
            
            
            
            
       
        
        }else{
            
             self.navigationController?.view.makeToast("Select a Customer first" )
            
        }
        
        
//        let storyboard: UIStoryboard = UIStoryboard(name: "AddNewVechicle", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "addVehicleVC") as! AddVehicleVC
//
//
//        self.navigationController?.pushViewController(vc, animated: true)
//
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch (textField){
        case entrytimeTxtFd!:
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            entrytimeTxtFd.text = dateFormatter.string(from: Date())
           
            break
            
        default:
            
            break
            
        }    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch (textField){
        case contactPersonTxtFd!:
            newSharedInstance.dealing_PersonNameUpdate(dealing_PersonNameInit: contactPersonTxtFd.text!)
            break
            
        default:
            
            break
            
        }
        
        
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if textField == customerNameTxtFd && (customerNameTxtFd.text?.characters.count)! > 1{
        
        
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            
            if updatedText.characters.count > 2{
            
            
            serviceCallAutocall(passText:updatedText)
            }
            
        }
            
        }
        else if textField == unitSerialNoTxtFd && (unitSerialNoTxtFd.text?.characters.count)! > 0{
            
            
            if let text = textField.text,
                let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange,
                                                           with: string)
                
                if updatedText.characters.count > 0{
                    
                    
                    serviceCallAutocallserial(passText:updatedText)
                }
                
            }
            
        }
        
        else if textField == vehicleNumberTxtFd && (vehicleNumberTxtFd.text?.characters.count)! > 0{
            
            
            if let text = textField.text,
                let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange,
                                                           with: string)
                
                if updatedText.characters.count > 0{
                    
                    if  (customerNameTxtFd.text?.characters.count)! > 1 {
                         serviceCallAutocallvehicle(passText:updatedText)
                    }else{
                        
                        serviceCallAutocallvehicleNoId(passText: updatedText)
                        
                    }
                   
                }
                
            }
            
        }
        
        
        
        
        return true
    }
    
    
    
    
    
    
}
extension ServiceRegistrationVC{
    
    func ServiceCallRepresenationVehicle(stringData:String) -> [String : Any] {
        
        let parameters:[String : Any] = ["Id":stringData]
        return parameters as [String : Any]
        
    }
    func ServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Service_Id":seguefromModel.Service_Id]
        return parameters as [String : Any]
        
    }
    func ServiceCallRepresenationSave() -> [String : Any] {
        
        let value : String = newSharedInstance.Customer_DetailId!
        let name : String = newSharedInstance.Customer_DetailName!
        let vehicleID : String = newSharedInstance.Customer_DetailVehicle_Reg_Id!
        
        
        
        var arrayPass : [NSDictionary] =  [[:]]
        arrayPass.removeAll()
        for item in menuListPass {
            
            
            
            if newSharedInstance.complintTypeArray.contains(item.checkBox_Id)  {
                
                let Dict : NSDictionary = ["Complaint_Type_Id":item.checkBox_Id]
                
                
                
                arrayPass.append(Dict)
                
            }
            
        }
        
        
        
        
        let detailJobValue : String = detailJob.text.isEmpty ? "" : detailJob.text!
        let remarksValue : String = remarksData.text.isEmpty ? "" : remarksData.text!
        let contactPersonValue : String = contactPersonTxtFd.text!.isEmpty ? "" : contactPersonTxtFd.text!
        let placeValue : String = placeAttentedTxtFd.text!.isEmpty ? "" : placeAttentedTxtFd.text!
        let entryTimeValue : String = entrytimeTxtFd.text!.isEmpty ? "" : entrytimeTxtFd.text!
        let createDateValue : String = dateTxtFd.text!.isEmpty ? "" : dateTxtFd.text!
        let customerAddressValue : String = customerAddressTxtFd.text!.isEmpty ? "" : customerAddressTxtFd.text!
        let mobileValue : String = mobileNoTxtFd.text!.isEmpty ? "" : mobileNoTxtFd.text!
        let engineHourValue : String = engineHourTxtFd.text!.isEmpty ? "" : engineHourTxtFd.text!
        let unitModelValue : String = unitModelTxtFd.text!.isEmpty ? "" : unitModelTxtFd.text!
          let vechicleNumberValue : String = vehicleNumberTxtFd.text!.isEmpty ? "" : vehicleNumberTxtFd.text!
        let typeOfServiceValue : String = serviceTypeTxtFd.text!.isEmpty ? "" : serviceTypeTxtFd.text!
        let typeOfServiceAccedentValue : String = serviceAccientTypeTxtFd.text!.isEmpty ? "" : serviceAccientTypeTxtFd.text!
         let customerCode : String = customerCodeTxtFd.text!.isEmpty ? "" : customerCodeTxtFd.text!

          let Serial_Number : String = unitSerialNoTxtFd.text!.isEmpty ? "" : unitSerialNoTxtFd.text!
        
        
        
        
        
        let parameters:[String : Any] = ["Customer_Code":customerCode,"CustomerName":name,"mobile_no_customer":mobileValue,"Customer_Address":customerAddressValue,"Vehicle_No":vechicleNumberValue,"Type_of_Service":typeOfServiceValue,"Type_Of_Accedent_Service":typeOfServiceAccedentValue,"Unit_Model":unitModelValue,"Engine_Hour":engineHourValue,"Place_Attended":placeValue,"Entry_time":entryTimeValue,"Details_of_Job":detailJobValue,"Special_Remarks":remarksValue ,"Customer_Ids":value,"Vehicle_Id":vehicleID,"Branch_Id":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"CreatedDate":createDateValue,"User_Id":userDefaults.GET_USERDEFAULTS(objectValue: "UserId"),"ContactPerson":contactPersonValue,"ComplaintTypeList":arrayPass,"Serial_Number":Serial_Number]
        
        
        
        
        
        return parameters as [String : Any]
        
    }
    func ServiceCallRepresenationUpdate() -> [String : Any] {
        
        let value : String = newSharedInstance.Customer_DetailId!
        let name : String = newSharedInstance.Customer_DetailName!
        let vehicleID : String = newSharedInstance.Customer_DetailVehicle_Reg_Id!
        let serviceID : String = newSharedInstance.Customer_DetailM_Model!
        
        
        var arrayPass : [NSDictionary] =  [[:]]
        arrayPass.removeAll()
        for item in menuListPass {
            
            
            
            if newSharedInstance.complintTypeArray.contains(item.checkBox_Id)  {
                
                let Dict : NSDictionary = ["Complaint_Type_Id":item.checkBox_Id]
                
                
                
                arrayPass.append(Dict)
                
            }
            
        }
        
        
        
        
        let detailJobValue : String = detailJob.text.isEmpty ? "" : detailJob.text!
        let remarksValue : String = remarksData.text.isEmpty ? "" : remarksData.text!
        let contactPersonValue : String = contactPersonTxtFd.text!.isEmpty ? "" : contactPersonTxtFd.text!
        let placeValue : String = placeAttentedTxtFd.text!.isEmpty ? "" : placeAttentedTxtFd.text!
        let entryTimeValue : String = entrytimeTxtFd.text!.isEmpty ? "" : entrytimeTxtFd.text!
        let createDateValue : String = dateTxtFd.text!.isEmpty ? "" : dateTxtFd.text!
        let customerAddressValue : String = customerAddressTxtFd.text!.isEmpty ? "" : customerAddressTxtFd.text!
        let mobileValue : String = mobileNoTxtFd.text!.isEmpty ? "" : mobileNoTxtFd.text!
        let engineHourValue : String = engineHourTxtFd.text!.isEmpty ? "" : engineHourTxtFd.text!
        let unitModelValue : String = unitModelTxtFd.text!.isEmpty ? "" : unitModelTxtFd.text!
        let vechicleNumberValue : String = vehicleNumberTxtFd.text!.isEmpty ? "" : vehicleNumberTxtFd.text!
        let typeOfServiceValue : String = serviceTypeTxtFd.text!.isEmpty ? "" : serviceTypeTxtFd.text!
        let typeOfServiceAccedentValue : String = serviceAccientTypeTxtFd.text!.isEmpty ? "" : serviceAccientTypeTxtFd.text!
        let customerCode : String = customerCodeTxtFd.text!.isEmpty ? "" : customerCodeTxtFd.text!
        
        let Serial_Number : String = unitSerialNoTxtFd.text!.isEmpty ? "" : unitSerialNoTxtFd.text!
        
        
        
        
        
        let parameters:[String : Any] = ["Service_Id":serviceID,"Customer_Code":customerCode,"CustomerName":name,"mobile_no_customer":mobileValue,"Customer_Address":customerAddressValue,"Vehicle_No":vechicleNumberValue,"Type_of_Service":typeOfServiceValue,"Type_Of_Accedent_Service":typeOfServiceAccedentValue,"Unit_Model":unitModelValue,"Engine_Hour":engineHourValue,"Place_Attended":placeValue,"Entry_time":entryTimeValue,"Details_of_Job":detailJobValue,"Special_Remarks":remarksValue ,"Customer_Ids":value,"Vehicle_Id":vehicleID,"Branch_Id":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"CreatedDate":createDateValue,"User_Id":userDefaults.GET_USERDEFAULTS(objectValue: "UserId"),"ContactPerson":contactPersonValue,"ComplaintTypeList":arrayPass,"Serial_Number":Serial_Number]
        
        
        
        
        
        return parameters as [String : Any]
        
    }
    func ServiceAutoCallRepresenation(stringData:String) -> [String : Any] {
        
        let parameters:[String : Any] = ["Customer_Name":stringData,"Branch_Id":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id")]
        return parameters as [String : Any]
        
    }
    func VechileListServiceCallRepresenation(stringData:String) -> [String : Any] {
        
        let parameters:[String : Any] = ["Branch_Id":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"Vehicle_No":stringData]
        return parameters as [String : Any]
        
    }
    func ServiceAutoCallRepresenationVehicle(stringData:String) -> [String : Any] {
        
        
        
        
        
        let value : String = newSharedInstance.Customer_DetailId!
        
        let parameters:[String : Any] = ["Vehicle_No":stringData,"Customer_Ids":value ]
        return parameters as [String : Any]
        
    }
    
    
    func ServiceAutoCallRepresenationSerial(stringData:String) -> [String : Any] {
        
        
        
        
        
        
        
        let parameters:[String : Any] = ["Serial_Number":stringData,"Customer_Ids":"0"]
        return parameters as [String : Any]
        
    }
    
    
}
