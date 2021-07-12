//
//  AssignTechnicianVC.swift
//  TransACNR
//
//  Created by Monish M S on 29/05/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit
import DropDown
import SkyFloatingLabelTextField
protocol PinRemoverDelegate: class {
    func removePin()
}



class AssignTechnicianVC:  UIViewController,UITextFieldDelegate  ,GetResultResponse {
    
    let techDrop = DropDown()
    let subTechDrop = DropDown()
    let functionCall = GetRespone()
    var displayNameArray : [String] = []
    var displayNamedictArray : [NSDictionary] = []
    var seguetoModel :DetailModel = DetailModel()
    @IBOutlet weak var firstpartTxtFd: SkyFloatingLabelTextField!
    weak var delegate: PinRemoverDelegate? = nil
      @IBOutlet weak var trackbutton: UIButton!
    
    @IBOutlet weak var secondpartTxtFd: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       serviceCall()
        
        techDrop.bottomOffset = CGPoint(x: 5, y:(firstpartTxtFd?.frame.height)!)
        techDrop.anchorView = firstpartTxtFd
        techDrop.direction = .bottom
        techDrop.width = firstpartTxtFd?.frame.width
        
        
        
        
        techDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.techDropNameOn(index: index, item: item)
        }
        
        
        subTechDrop.bottomOffset = CGPoint(x: 5, y:(secondpartTxtFd?.frame.height)!)
        subTechDrop.anchorView = secondpartTxtFd
        subTechDrop.direction = .bottom
        subTechDrop.width = secondpartTxtFd?.frame.width
        
        
        
        
        subTechDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.subTechDropNameOn(index: index, item: item)
        }
        let selectedImage = UIImage(named: "ic_checkbox_empty")
        trackbutton.setImage(selectedImage, for: .normal)
        
    }
    
    func techDropNameOn(index: Int, item: String){
        
      
        
        
        firstpartTxtFd?.text = item
        
      
        
    }
    
    func subTechDropNameOn(index: Int, item: String){
        
        
       
        
        
        if (secondpartTxtFd?.text?.isEmpty)!  {
            
            secondpartTxtFd?.text = item
        }
        else{
        let displayvalue: String = (secondpartTxtFd?.text)! + "," + item
        
        secondpartTxtFd?.text = displayvalue
        
        }
        if let index = displayNameArray.index(of:item) {
            displayNameArray.remove(at: index)
        }
        
        
        subTechDrop.dataSource = displayNameArray
        
    }
    @IBAction func trackAction(_ sender: UIButton) {
        
        let selectedImage = UIImage(named: "ic_checkbox_empty")
        
        let deselectedImage = UIImage(named: "ic_checkbox_selected")


        if sender.image(for: .normal ) == selectedImage
        
        {
             sender.setImage(deselectedImage, for: .normal)
            
        }else{
            
            sender.setImage(selectedImage, for: .normal)
        }
        
   
   
    }
    
    
    @IBAction func createAction(_ sender: UIButton) {
        
        if HelperClass.TEXTFIELDIsEmpty(value: firstpartTxtFd!) {
            
            Utilities.AlertActionDone(Title: "", Message: TARASSIGNTECH, ButtonText: TARDone,  setView:self.view)
            
            
        }
      
            
        else{
            addserviceCall()
            
        }
        
    }
    func serviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: AddVehicleServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRAllTechnicianByBranch as NSString)
    }
    
    func addserviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: AddTechnicianServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransAssignTechnician as NSString)
    }
    
    
    
    
    
    func GetServiceRespone(param: NSDictionary) {
        print(param)
        
        
        
        
        
        
        
        if let value = param["TechniciansList"] {
            
            displayNamedictArray.removeAll()
            displayNameArray.removeAll()
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                displayNamedictArray.append(obj)
                displayNameArray.append(obj.object(forKey: "TechnicianName") as! String)
                
            }
        }
        else{
            
            delegate?.removePin()
             self.view .removeFromSuperview()
        }
        
      
        
    }
    @IBAction func techTypeAction(_ sender: Any) {
        
        
        techDrop.dataSource = displayNameArray
        techDrop.show()
    }
    @IBAction func subTechTypeAction(_ sender: Any) {
        
        if !(firstpartTxtFd.text?.isEmpty)! {
            
            
            if let index = displayNameArray.index(of:firstpartTxtFd.text!) {
                displayNameArray.remove(at: index)
            }
            
            
            subTechDrop.dataSource = displayNameArray
            subTechDrop.show()
            
            
            
        }
        
    }
    
    
    
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
        self.view .removeFromSuperview()
    }
    
    @IBAction func tapGestureaction(_ sender: Any) {
        self.view .removeFromSuperview()
        
        
    }
   
    
    
    
    
    
    

    
    
}
extension AssignTechnicianVC{
    
    
    func AddTechnicianServiceCallRepresenation() -> [String : Any] {
        var technician:String = ""
      let value : String = self.seguetoModel.Service_Id!
        
        
        
        
        
        
        
        
        for obj in displayNamedictArray {
            
          
             let  test = obj.object(forKey: "TechnicianName") as! String
            if test == firstpartTxtFd.text! {
                
                let Complaint_Type_Id : Int = obj.object(forKey: "Employee_Id")as? Int ?? 0
                technician = "\(Complaint_Type_Id)"
                
            }
           
            
            
        }
      
        
        
        if (secondpartTxtFd?.text?.isEmpty)!  {
            
            let parameters:[String : Any] = ["Technician_Id":technician,"Service_Id":value,"User_Id":userDefaults.GET_USERDEFAULTS(objectValue: "UserId"),"AllowStatus":"1","SubTechnicians":""]
            return parameters as [String : Any]
        }
        else{
            let displayvalue: String = (secondpartTxtFd?.text)!
            
           let wordsToLearn = displayvalue.components(separatedBy: ",")
            
            
            var arrayPass : [NSDictionary] =  [[:]]
            arrayPass.removeAll()
            
            
            
            for obj in displayNamedictArray {
                
                
                let  test = obj.object(forKey: "TechnicianName") as! String
                if wordsToLearn.contains(test) {
                    
                    let Complaint_Type_Id : Int = obj.object(forKey: "Employee_Id")as? Int ?? 0
                  let  subtechnician = "\(Complaint_Type_Id)"
                    let Dict : NSDictionary = ["Employee_Id":subtechnician]
                    
                    
                    
                    arrayPass.append(Dict)
                    
                    
                    
                    
                }
                
                
                
            }
            
            
            
            
            
          
            
            let parameters:[String : Any] = ["Technician_Id":technician,"Service_Id":value,"User_Id":userDefaults.GET_USERDEFAULTS(objectValue: "UserId"),"AllowStatus":"1","SubTechnicians":arrayPass]
            return parameters as [String : Any]
            
            
            
        }
        
       
        
    }
    
    
    
    
    
    
    
    
    
    
    func AddVehicleServiceCallRepresenation() -> [String : Any] {
    
        
        
        
        
        
        
        let parameters:[String : Any] = ["Branch_Id":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id")]
        return parameters as [String : Any]
        
    }
}
