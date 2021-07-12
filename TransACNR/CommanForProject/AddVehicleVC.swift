//
//  AddVehicleVC.swift
//  TransACNR
//
//  Created by Monish M S on 30/04/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class AddVehicleVC: UIViewController,UITextFieldDelegate  ,GetResultResponse {
    
    
    
    let functionCall = GetRespone()

    
    
    @IBOutlet weak var firstpartTxtFd: UITextField!
    @IBOutlet weak var secondpartTxtFd: UITextField!
    @IBOutlet weak var thirdpartTxtFd: UITextField!
    @IBOutlet weak var fourthpartTxtFd: UITextField!
    
    
    @IBAction func createAction(_ sender: UIButton) {
        
        if HelperClass.TEXTFIELDIsEmpty(value: firstpartTxtFd!) {
            
            Utilities.AlertActionDone(Title: "", Message: TARINCORRECTVEHICLENumber, ButtonText: TARDone,  setView:self.view)
            
            
        }else if HelperClass.TEXTFIELDIsEmpty(value: secondpartTxtFd!){
            
            Utilities.AlertActionDone(Title: "", Message: TARINCORRECTVEHICLENumber, ButtonText: TARDone,  setView:self.view)
            
        }
        else if HelperClass.TEXTFIELDIsEmpty(value: thirdpartTxtFd!){
            
            Utilities.AlertActionDone(Title: "", Message: TARINCORRECTVEHICLENumber, ButtonText: TARDone,  setView:self.view)
            
        }
        else if HelperClass.TEXTFIELDIsEmpty(value: fourthpartTxtFd!){
            
            Utilities.AlertActionDone(Title: "", Message: TARINCORRECTVEHICLENumber, ButtonText: TARDone,  setView:self.view)
            
        }
            
        else{
            serviceCall()
            
        }
        
    }
    func serviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: AddVehicleServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRSaveVehicleDetails as NSString)
    }
    
    func GetServiceRespone(param: NSDictionary) {
        print(param)

       
        
       self.view .removeFromSuperview()
        
        
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
       self.view .removeFromSuperview()
    }
    
    @IBAction func tapGestureaction(_ sender: Any) {
      self.view .removeFromSuperview()
        
        
    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let currentText = textField.text ?? ""
//        guard let stringRange = Range(range, in: currentText) else { return false }
//
//        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
//
//
//
//
//
//        if textField == firstpartTxtFd {
//
//            if updatedText.count == 2{
//            secondpartTxtFd.becomeFirstResponder()
//            }
//
//
//        }else if textField == secondpartTxtFd {
//             if updatedText.count == 2{
//
//            secondpartTxtFd.becomeFirstResponder()
//
//
//            }
//        }else if textField == thirdpartTxtFd {
//             if updatedText.count == 2{
//            fourthpartTxtFd.becomeFirstResponder()
//            }
//        }
//
//   return true
//
//
//
//    }
//
    
    
 
    
    
    
    
    //TODO:- Text Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        switch (textField){
        case firstpartTxtFd!:
            secondpartTxtFd?.becomeFirstResponder()
            break
        case secondpartTxtFd!:
            thirdpartTxtFd?.becomeFirstResponder()
            break
        case thirdpartTxtFd!:
            fourthpartTxtFd?.becomeFirstResponder()
            break
            
            
            
        default:
            textField.resignFirstResponder()
            break
            
        }
        return true
    }
   

}
extension AddVehicleVC{
    
    
    func AddVehicleServiceCallRepresenation() -> [String : Any] {
        let dealing_person:String = (firstpartTxtFd?.text)! + " " + (secondpartTxtFd?.text)! + " " + (thirdpartTxtFd?.text)! + " " + (fourthpartTxtFd?.text)!
      
        
        
        
        
        
        
        
        let parameters:[String : Any] = ["Branch_Id":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"Vehicle_No":dealing_person,"Vehicle_Details":"","Customer_Ids":newSharedInstance.Customer_DetailId!]
        return parameters as [String : Any]
        
    }
}
