//
//  ViewController.swift
//  JobCard
//
//  Created by Arunbabu.j on 30/05/18.
//  Copyright © 2018 Arunbabu.j. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField


class JobCardVC: UIViewController,UITextFieldDelegate,GetResultResponse
{

    
    @IBOutlet weak var subView: UIView!
var seguefromModel :DetailModel = DetailModel()
    @IBOutlet weak var mainView: UIView!
    
    
    @IBOutlet weak var jobCard: SkyFloatingLabelTextField!
    @IBOutlet weak var name: SkyFloatingLabelTextField!
    @IBOutlet weak var contactperson: SkyFloatingLabelTextField!
    @IBOutlet weak var contactNo: SkyFloatingLabelTextField!
    @IBOutlet weak var address: SkyFloatingLabelTextField!
    @IBOutlet weak var unitName: SkyFloatingLabelTextField!
    @IBOutlet weak var unitModel: SkyFloatingLabelTextField!
    @IBOutlet weak var unitSerial: SkyFloatingLabelTextField!
    @IBOutlet weak var commiDate: SkyFloatingLabelTextField!
    @IBOutlet weak var warranty: SkyFloatingLabelTextField!
    @IBOutlet weak var engineNo: SkyFloatingLabelTextField!
    @IBOutlet weak var vehicleNo: SkyFloatingLabelTextField!
    @IBOutlet weak var engineHours: SkyFloatingLabelTextField!
    @IBOutlet weak var placeAttended: SkyFloatingLabelTextField!
    @IBOutlet weak var gstNo: SkyFloatingLabelTextField!
    @IBOutlet weak var timeOfRepair: SkyFloatingLabelTextField!
    @IBOutlet weak var deliveryDate: SkyFloatingLabelTextField!
    @IBOutlet weak var problemReporting: SkyFloatingLabelTextField!
    @IBOutlet weak var jobCarried: SkyFloatingLabelTextField!
    @IBOutlet weak var productName: SkyFloatingLabelTextField!
    @IBOutlet weak var quantity: SkyFloatingLabelTextField!
    @IBOutlet weak var remarks: SkyFloatingLabelTextField!

    @IBOutlet weak var technitionName: UILabel!
    @IBOutlet weak var subTechnitionName: UILabel!
    
    
    
    
    
    
    
    
    
    
       let functionCall = GetRespone()
    
    @IBOutlet weak var submitBtn: UIButton!
    
    
    @IBOutlet weak var btn: UIButton!
    
    
    @IBAction func backNavigation(_ sender: UIButton)
    {
         _ = navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    @IBAction func btnpres(_ sender: UIButton)
    {
       
        if (subView.isHidden == false)
        {
           subView.isHidden = true
            mainView.isHidden = false
        }
        
        else
        {
            subView.isHidden = false
        mainView.isHidden = true
        }
 
    }
    
    @IBAction func cancelbtn(_ sender: UIButton)
    {
        //self.view.removeFromSuperview()
        
        if (subView.isHidden == true)
        {
            subView.isHidden = false
            mainView.isHidden = true
        }
            
        else
        {
            subView.isHidden = true
            mainView.isHidden = false
        }

    }
    func serviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRGetJobCardDetails as NSString)
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func addBtn(_ sender: UIButton)
    {
        
    }
    func GetServiceRespone(param: NSDictionary) {
        
          if let value = param["JobCardNo"] {
        
            jobCard.text = value as? String ?? ""
        }
        
        
        if let value = param["JObCardDetails"] {

            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary

                
              name.text = obj.object(forKey: "Customer_Name") as? String ?? ""
 contactperson.text = obj.object(forKey: "ContactPerson") as? String ?? ""
contactNo.text = obj.object(forKey: "Contact_Details") as? String ?? ""
 address.text = obj.object(forKey: "Customer_Address") as? String ?? ""
// unitName.text = obj.object(forKey: "Customer_Name") as? String ?? ""
unitModel.text = obj.object(forKey: "Unit_Model") as? String ?? ""
unitSerial.text = obj.object(forKey: "Customer_Name") as? String ?? ""
commiDate.text = obj.object(forKey: "V_comissioning_Date") as? String ?? ""
warranty.text = obj.object(forKey: "InOutWarranty") as? String ?? ""
engineNo.text = obj.object(forKey: "EngineSlNo") as? String ?? ""
vehicleNo.text = obj.object(forKey: "Vehicle_Number") as? String ?? ""
engineHours.text = obj.object(forKey: "Engine_Hour") as? String ?? ""
placeAttended.text = obj.object(forKey: "Place_Attended") as? String ?? ""
gstNo.text = obj.object(forKey: "Tin_No") as? String ?? ""
timeOfRepair.text = obj.object(forKey: "V_Repair_Time") as? String ?? ""
deliveryDate.text = obj.object(forKey: "V_Delivery_Date") as? String ?? ""


                
                
                
                
           }
        }
        
        if let value = param["JobCardSubTechnicians"] {
            
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                
                technitionName.text = obj.object(forKey: "TechiName") as? String ?? ""
                subTechnitionName.text = obj.object(forKey: "SubTechiName") as? String ?? ""
           
                
                
                
                
                
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serviceCall()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension JobCardVC{
    
    
    func ServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Service_Id":seguefromModel.Service_Id]
        return parameters as [String : Any]
        
    }
}
