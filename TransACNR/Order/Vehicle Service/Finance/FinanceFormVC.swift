//
//  FinanceFormVC.swift
//  TransACNR
//
//  Created by Monish M S on 04/06/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class FinanceFormVC:UIViewController,UITextFieldDelegate,GetResultResponse,UITableViewDelegate,UITableViewDataSource
{
    
   
    var seguefromModel :DetailModel = DetailModel()
    @IBOutlet weak var mainView: UIView!
    var menuListdisplay :[NSDictionary]  =  [[:]]


    @IBOutlet weak var problemReportingviewHeight: NSLayoutConstraint!
     @IBOutlet weak var jobCarriedviewHeight: NSLayoutConstraint!
@IBOutlet weak var mainviewHeight: NSLayoutConstraint!
@IBOutlet weak var tableviewHeight: NSLayoutConstraint!


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
 
    @IBOutlet weak var problemReportingDate: UILabel!
    @IBOutlet weak var jobCarriedDate: UILabel!
    @IBOutlet weak var repairDate: SkyFloatingLabelTextField!
    @IBOutlet weak var problemReporting: UITextView!
    @IBOutlet weak var jobCarried: UITextView!
        @IBOutlet weak var spareTable: UITableView!
    
    
    
    
    
    
    let functionCall = GetRespone()
    
    @IBOutlet weak var submitBtn: UIButton!
    

    
    @IBAction func backNavigation(_ sender: UIButton)
    {
        _ = navigationController?.popViewController(animated: true)
        
    }
    @IBAction func nextAction(_ sender: UIButton)
    {
        performSegue(withIdentifier: "financeDetails", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "financeDetails") {
            
            
            let secondViewController = segue.destination as! FinanceFormDetailsVC
       
            
            
            secondViewController.seguefromModel = seguefromModel
        
            
        }
        
        
    }
   
    func serviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRGetJobCardDetails as NSString)
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
                
                repairDate.text = obj.object(forKey: "V_Repair_Date") as? String ?? ""
                
                
                
            }
        }
        
      
        if let value = param["JobcardReportFindingList"] {
            
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                
                problemReportingDate.text = obj.object(forKey: "Created_Date") as? String ?? ""
                problemReporting.text = obj.object(forKey: "ProblemReportFinding") as? String ?? ""
                
                
                    let value1 =  problemReporting.text.height(withConstrainedWidth: self.view.frame.size.width - 130, font: UIFont.systemFont(ofSize: 13, weight:.regular))
                if value1 > 1000 {
                
             problemReportingviewHeight.constant = 1000
                }else{
                    
                      problemReportingviewHeight.constant = value1
                    
                }
            }
        }
        
        if let value = param["JobCardCarriedOutList"] {
            
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                
                jobCarriedDate.text = obj.object(forKey: "Created_Date") as? String ?? ""
                jobCarried.text = obj.object(forKey: "JobCarried") as? String ?? ""
                let value1 =  jobCarried.text.height(withConstrainedWidth: self.view.frame.size.width - 130, font: UIFont.systemFont(ofSize: 13, weight:.regular))
                if value1 > 1000 {
                    
                    jobCarriedviewHeight.constant = 1000
                }else{
                    
                    jobCarriedviewHeight.constant = value1
                    
                }
               
              
            }
        }
        if let value = param["JobCardAlreadySavedSpearsFinance"] {
            menuListdisplay.removeAll()
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                
               menuListdisplay.append(obj)
                
                
            }
            tableviewHeight.constant =       CGFloat(menuListdisplay.count  * 30)
            
            
            
            
            
        }
        
        spareTable.reloadData()
        
        
        
           mainviewHeight.constant = 1220 + problemReportingviewHeight.constant + jobCarriedviewHeight.constant + tableviewHeight.constant
        
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serviceCall()
        problemReportingviewHeight.constant = 0
        jobCarriedviewHeight.constant = 0
        tableviewHeight.constant = 0
        mainviewHeight.constant = 1220
          spareTable.tableFooterView = UIView(frame: .zero)
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return menuListdisplay.count
        
        
    }
  
    
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {

        
        
        
        return 30.0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
            
            var cell = FinaceFormTVCell()
            
            cell = spareTable.dequeueReusableCell(withIdentifier: "FinaceFormID", for: indexPath ) as! FinaceFormTVCell
            
            
            configurejobdisplayCell(cell: cell,forrowatindepath:indexPath as NSIndexPath)
            
            return cell
            
            
       
    }
    
    
    
    func configurejobdisplayCell(cell:FinaceFormTVCell,forrowatindepath indexPath:NSIndexPath){
        
        let model : NSDictionary = menuListdisplay[indexPath.row]
        
        cell.spareHead.text = model.object(forKey: "Product_Name") as? String ?? ""
        
        if let totalfup = (model["Quantity"] as? NSString)?.doubleValue {
            
            cell.spareCount.text =  "\(totalfup)"
            
        }
        cell.spareRem.text = model.object(forKey: "Description") as? String ?? ""
        
       
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
  
}
extension FinanceFormVC{
    
    
    func ServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Service_Id":seguefromModel.Service_Id]
        return parameters as [String : Any]
        
    }
}
