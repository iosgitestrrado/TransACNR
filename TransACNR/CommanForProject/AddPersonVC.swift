//
//  AddPersonVC.swift
//  TransACNR
//
//  Created by Monish M S on 30/04/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class AddPersonVC: UIViewController ,GetResultResponse {
 
    
    
    let functionCall = GetRespone()
@IBOutlet weak var branchTxtFd: SkyFloatingLabelTextField!
    
  
    @IBOutlet weak var customerCodeTxtFd: SkyFloatingLabelTextField!
 
    @IBOutlet weak var customerNameTxtFd: SkyFloatingLabelTextField!

    @IBOutlet weak var mobileNoTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNumberTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var panNumberTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var gstNumberTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var emailIdTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var accountNumberTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var addressTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var banknameTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var ifscTxtFd: SkyFloatingLabelTextField!
    
    @IBOutlet weak var barachNameAddressTxtFd: SkyFloatingLabelTextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }
    func setupUI()  {
       
        customerCodeTxtFd.text = newSharedInstance.CustomerCodeID
        branchTxtFd.text = userDefaults.GET_USERDEFAULTS(objectValue:"BranchName")
        
    }

    @IBAction func backNavigationAction(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func savedataAction(_ sender: Any) {
        
        if HelperClass.TEXTFIELDIsEmpty(value: customerNameTxtFd!) {
            
            Utilities.AlertActionDone(Title: "", Message: TAREMPTYCustomerName, ButtonText: TARDone,  setView:self.view)
            
            
        } else if isValidInput(Input: customerNameTxtFd.text!) == false || customerNameTxtFd.text!.contains(".") {
            
            
            Utilities.AlertActionDone(Title: "", Message: "Name field accepts only alphabatics", ButtonText: TARDone,  setView:self.view)
            
            
            
            
        }
        
        
        
        
        
        else if HelperClass.TEXTFIELDIsEmpty(value: mobileNoTxtFd!){
            
            Utilities.AlertActionDone(Title: "", Message: TAREMPTYMobileNumber, ButtonText: TARDone,  setView:self.view)
            
        }
        else if mobileNoTxtFd.text?.characters.count != 10{
            
            Utilities.AlertActionDone(Title: "", Message: TARINVALIDMobileNumber, ButtonText: TARDone,  setView:self.view)
            
        }
        else if !HelperClass.TEXTFIELDIsEmpty(value: emailIdTxtFd!) && !HelperClass.isValidEmail(testStr: emailIdTxtFd.text!){
            
            Utilities.AlertActionDone(Title: "", Message: TARINVALIDEmail, ButtonText: TARDone,  setView:self.view)
            
        }
            
        
        else{
            
            self.serviceCall()
            
        }
        
    }
    
    func isValidInput(Input:String) -> Bool {
        let myCharSet=CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
        let output: String = Input.trimmingCharacters(in: myCharSet.inverted)
        let isValid: Bool = (Input == output)
        print("\(isValid)")
        
        return isValid
    }
    
    
    func serviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: AddPersonServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRSaveCustomerDetails as NSString)
    }
    
    
    func GetServiceRespone(param: NSDictionary) {
        print(param)
        
        let   dict =  param.object(forKey: "LastInserted_Customer") as! NSDictionary
        let Customer_Id : Int = dict.object(forKey: "Customer_Id")as? Int ?? 0
        let stringCustomer_Id = "\(Customer_Id)"
        let Vehicle_Reg_Id : Int = dict.object(forKey: "Vehicle_Reg_Id")as? Int ?? 0
        let stringVehicle_Reg_Id = "\(Vehicle_Reg_Id)"
        let Registration_No : Int = dict.object(forKey: "Registration_No")as? Int ?? 0
        let stringRegistration_No = "\(Registration_No)"
        let M_Model : Int = dict.object(forKey: "M_Model")as? Int ?? 0
        let stringM_Model = "\(M_Model)"
        let SerialNumber : Int = dict.object(forKey: "SerialNumber")as? Int ?? 0
        let stringSerialNumber = "\(SerialNumber)"
        
        
        
        newSharedInstance.CustomerDetailsUpdate(Customer_DetailIdInit: stringCustomer_Id , Customer_DetailCodeInit: dict.object(forKey: "Customer_Code") as? String ?? "", Customer_DetailNameInit: dict.object(forKey: "Customer_Name") as? String ?? "", Customer_DetailAdreessInit: dict.object(forKey: "Customer_Address") as? String ?? "", Customer_DetailmobileNoInit: dict.object(forKey: "Mobile_No")as? String ?? "", Customer_DetailRegistration_NoInit: stringRegistration_No, Customer_DetailM_ModelInit: stringM_Model, Customer_DetailSerialNumberInit: stringSerialNumber, Customer_DetailVehicle_Reg_IdInit: stringVehicle_Reg_Id)
        
         _ = navigationController?.popViewController(animated: true)
        
        
    }
}
extension AddPersonVC{
    
    
    func AddPersonServiceCallRepresenation() -> [String : Any] {
        var dealing_person:String = ""
        if let string = newSharedInstance.dealing_PersonName, !newSharedInstance.dealing_PersonName.isEmpty {
            dealing_person =  string
        }
        
       
        
        
        
        
        let parameters:[String : Any] = ["Branch_Id":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"AccountNo":accountNumberTxtFd?.text ?? "","BankName":banknameTxtFd?.text ?? "","Branch_Address":barachNameAddressTxtFd?.text ?? "","Customer_Address":addressTxtFd?.text ?? "","Customer_Code":customerCodeTxtFd?.text ?? "","CustomerName":customerNameTxtFd?.text ?? "","dealing_person":dealing_person,"Email_Id":emailIdTxtFd?.text ?? "","IFSC_Code":ifscTxtFd?.text ?? "","Mobile_No":mobileNoTxtFd?.text ?? "","Pan_No":panNumberTxtFd?.text ?? "","Phone_No_Customer":phoneNumberTxtFd?.text ?? "","Tin_No":gstNumberTxtFd?.text ?? ""]
        return parameters as [String : Any]
        
    }
}
