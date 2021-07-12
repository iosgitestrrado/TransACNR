//
//  LoginVC.swift
//  TransACNR
//
//  Created by Monish M S on 25/04/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
//Login TransAdmin : admin@ACNR23
class LoginVC: UIViewController,GetResultResponse,UITextFieldDelegate{
    
    @IBOutlet weak var emailTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTxtFd: SkyFloatingLabelTextField!
    @IBOutlet weak var eyeButton: UIButton!
    
    let functionCall = GetRespone()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        if HelperClass.TEXTFIELDIsEmpty(value: emailTxtFd!) {
            
            Utilities.AlertActionDone(Title: "", Message: TAREMPTYEmail, ButtonText: TARDone,  setView:self.view)
            
            
        }else if HelperClass.TEXTFIELDIsEmpty(value: passwordTxtFd!){
            
            Utilities.AlertActionDone(Title: "", Message: TAREMPTYPassword, ButtonText: TARDone,  setView:self.view)
            
        }else{
            
            self.serviceCall()
            
        }
    }
    
    
    
    func serviceCall()
    {

        functionCall.delegete = self
        functionCall.getserviceCall(param: LoginServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRLogin as NSString)
    }
    
   func GetServiceRespone(param: NSDictionary)
   {
    
    let   dict =  param.object(forKey: "Data") as! NSDictionary
    let Branch_Id : Int = dict.object(forKey: "Branch_Id")as? Int ?? 1
    let stringBranch_Id = "\(Branch_Id)"
    let UserId : Int = dict.object(forKey: "UserId")as? Int ?? 1
    let stringUserId = "\(UserId)"
    let RoleId : Int = dict.object(forKey: "role_Id")as? Int ?? 1
    let stringRoleId = "\(RoleId)"
   
        userDefaults.SET_USERDEFAULTS(user_language: true, objectValue: "loginComplete")
        userDefaults.SET_USERDEFAULTS(user_language: dict.object(forKey: "UserName") as? String ?? "", objectValue: "UserName")
        userDefaults.SET_USERDEFAULTS(user_language:  stringBranch_Id  , objectValue: "Branch_Id")
        userDefaults.SET_USERDEFAULTS(user_language: stringUserId , objectValue: "UserId")
        userDefaults.SET_USERDEFAULTS(user_language: stringRoleId , objectValue: "RoleId")
        userDefaults.SET_USERDEFAULTS(user_language: dict.object(forKey: "Branch_Name") as? String ?? "" , objectValue: "BranchName")
        performSegue(withIdentifier: "paasHome", sender: self)
    }
    
    
    @IBAction func showHideAction(sender: AnyObject) {
        
        if passwordTxtFd.isSecureTextEntry{
            
            
            eyeButton.setImage(#imageLiteral(resourceName: "iconEyesOpen"), for: .normal)
            passwordTxtFd.isSecureTextEntry = false
            
        }else{
            
            eyeButton.setImage(#imageLiteral(resourceName: "iconEyesClose"), for: .normal)
            passwordTxtFd.isSecureTextEntry = true
        }
    }
    
    
    
    @IBAction func tapGestureaction(_ sender: Any) {
        
        emailTxtFd?.resignFirstResponder()
        passwordTxtFd?.resignFirstResponder()
        
        
    }
    //TODO:- Text Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        switch (textField){
        case emailTxtFd!:
            passwordTxtFd?.becomeFirstResponder()
            break
            
        default:
            textField.resignFirstResponder()
            break
            
        }
        return true
    }
}
extension LoginVC{
    
    
    func LoginServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["UserName":emailTxtFd?.text ?? "","Password":passwordTxtFd?.text ?? "","FCMToken":"ccccccccc"]
        return parameters as [String : Any]
        
    }
}
