//
//  ChangeOwnershipVC.swift
//  TransACNR
//
//  Created by Monish M S on 30/05/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit
import DropDown
protocol changeOwnershipAddDelegate: class {
    func changeOwnershipreloaded()
}





class ChangeOwnershipVC:  UIViewController,UITextFieldDelegate  ,GetResultResponse {
    
    let functionCall = GetRespone()
    var displayNameArray : [String] = []
    var displayNamedictArray : [NSDictionary] = []
    var VehicleID : String = ""
     var customerID : String = ""
     var delegateAdd: changeOwnershipAddDelegate? = nil
     let nameDrop = DropDown()
    
    
    
    @IBOutlet weak var firstpartTxtFd: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameDrop.bottomOffset = CGPoint(x: 5, y:0)
        nameDrop.anchorView = firstpartTxtFd
        nameDrop.direction = .top
        nameDrop.width = firstpartTxtFd?.frame.width
        
        
        
        
        nameDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.customerNameOn(index: index, item: item)
        }
        
        
        
        
    }
    
    func customerNameOn(index: Int, item: String){
        
        firstpartTxtFd.resignFirstResponder()
        
        firstpartTxtFd?.text = item
        
        
        for itemValue in displayNamedictArray {
            let obj = itemValue as NSDictionary
            let name = obj.object(forKey: "Customer_Name") as! String
            
            
            if name == item {
                
                
                let Customer_Id : Int = obj.object(forKey: "Customer_Id")as? Int ?? 0
                customerID = "\(Customer_Id)"
                
                
            
                
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    @IBAction func createAction(_ sender: UIButton) {
        
        if customerID == "" {
            
            Utilities.AlertActionDone(Title: "", Message: TAREMPTYCustomerName, ButtonText: TARDone,  setView:self.view)
            
            
        }
            
            
        else{
            serviceCall()
            
        }
        
    }
    func serviceCall()  {

        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRChangeOwnerShip as NSString)
    }
    
    func GetServiceRespone(param: NSDictionary) {
        print(param)
        
        if let value = param["CustomerAutoComplete"] {
            
            displayNamedictArray.removeAll()
            displayNameArray.removeAll()
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                displayNamedictArray.append(obj)
                displayNameArray.append(obj.object(forKey: "Customer_Name") as! String)
                
            }
            
            if displayNameArray.count > 0{
                
                nameDrop.dataSource = displayNameArray
                nameDrop.show()
                
            }
            
            
            
            
        }else{
            
            delegateAdd?.changeOwnershipreloaded()
            self.view .removeFromSuperview()
            
        }
        
       
        
        
    }
  
    
    
    
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
         delegateAdd?.changeOwnershipreloaded()
        
        self.view .removeFromSuperview()
    }
    
    @IBAction func tapGestureaction(_ sender: Any) {
        
         delegateAdd?.changeOwnershipreloaded()
        self.view .removeFromSuperview()
        
        
    }
    
    
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if textField == firstpartTxtFd && (firstpartTxtFd.text?.characters.count)! > 1{
            
            
            if let text = textField.text,
                let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange,
                                                           with: string)
                
                if updatedText.characters.count > 2{
                    
                    
                    serviceCallAutocall(passText:updatedText)
                }
                
            }
            
        }
        
        
        
        
        return true
    }
    
    func serviceCallAutocall(passText : String)  {
       
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceAutoCallRepresenation(stringData: passText), tpye: TransACNRBaseTestUrl+TransACNRAutoCompleteByCustomer as NSString)
    }
    
    
    
    
}
extension ChangeOwnershipVC{
    
    func ServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Vehicle_Id":VehicleID,"Branch_Id":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"Customer_Ids":customerID,"User_Id":userDefaults.GET_USERDEFAULTS(objectValue:"UserId")]
        return parameters as [String : Any]
        
    }



    func ServiceAutoCallRepresenation(stringData:String) -> [String : Any] {
        
        let parameters:[String : Any] = ["Customer_Name":stringData,"Branch_Id":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id")]
        return parameters as [String : Any]
        
    }
}
