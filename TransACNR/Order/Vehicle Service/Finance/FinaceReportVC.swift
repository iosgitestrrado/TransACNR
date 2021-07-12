//
//  FinaceReportVC.swift
//  TransACNR
//
//  Created by Monish M S on 05/06/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class FinaceReportVC:UIViewController,UITextFieldDelegate,GetResultResponse,UITableViewDelegate,UITableViewDataSource
{
    
    
    var seguefromModel :DetailModel = DetailModel()
    @IBOutlet weak var mainView: UIView!
    var menuListdisplay :[NSDictionary]  =  [[:]]
     var invoiceListdisplay :[NSDictionary]  =  [[:]]
    var paymentListdisplay :[NSDictionary]  =  [[:]]
    
    var dataBool : Bool = false
    @IBOutlet weak var problemReportingviewHeight: NSLayoutConstraint!
    @IBOutlet weak var jobCarriedviewHeight: NSLayoutConstraint!
    @IBOutlet weak var mainviewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var invoiceTableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var paymentTableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var namewidth: NSLayoutConstraint!
    @IBOutlet weak var addreesWidth: NSLayoutConstraint!
    
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
    @IBOutlet weak var deliveryTime: SkyFloatingLabelTextField!
    @IBOutlet weak var totalAmount: SkyFloatingLabelTextField!
    @IBOutlet weak var paidAmount: SkyFloatingLabelTextField!
    @IBOutlet weak var balanceAmount: SkyFloatingLabelTextField!
     @IBOutlet weak var repairDate: SkyFloatingLabelTextField!
    
    
    
    
    @IBOutlet weak var problemReportingDate: UILabel!
    @IBOutlet weak var jobCarriedDate: UILabel!
    @IBOutlet weak var problemReporting: UITextView!
    @IBOutlet weak var jobCarried: UITextView!
    @IBOutlet weak var spareTable: UITableView!
    @IBOutlet weak var invoiceTable: UITableView!
    @IBOutlet weak var paymentTable: UITableView!
    
    
    let functionCall = GetRespone()
    
    @IBOutlet weak var submitBtn: UIButton!
    
    
    
    @IBAction func backNavigation(_ sender: UIButton)
    {
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    func serviceCalldata()  {
        dataBool = true
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRGetFinanceDetailsOnPageLoad as NSString)
    }
    
    func serviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRGetJobCardDetails as NSString)
    }
    func PASSDATE(STRINGDATE:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let datePass:Date = dateFormatter.date(from: String(STRINGDATE.prefix(10))) ??  Date()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        
        
        return dateFormatter.string(from: datePass)
    }
    
    func GetServiceRespone(param: NSDictionary) {
        
        var totalamount:Float32 =  0.0
        if dataBool {
            
            
            if let value = param["SavedInvoicedetails"] {
                invoiceListdisplay.removeAll()
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    let  new :Float32 =  obj.object(forKey: "Total_Amount") as! Float32
                    
                    totalamount  = totalamount + new
                    invoiceListdisplay.append(obj)
                    
                    
                }
                invoiceTableviewHeight.constant =       CGFloat(invoiceListdisplay.count  * 30)
                
                
                
                
                
            }
            if let value = param["PaymentModeHistory"] {
                paymentListdisplay.removeAll()
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                   
                    paymentListdisplay.append(obj)
                    
                    
                }
                paymentTableviewHeight.constant =       CGFloat(paymentListdisplay.count  * 30)
                
                
                
                
                
            }
            
            
            

            
            
            totalAmount.text = "\(totalamount)"
           
            
            
            
            
            
            if let value = param["PaidAmount"] {
                
                let value1 = value as? Float32 ?? 0.0
                
                let balance = totalamount - value1


                paidAmount.text = "\(value1)"
                
                
                balanceAmount.text = "\(balance)"
                
                
                
            }
            
            
            
            
            
            invoiceTable.reloadData()
           paymentTable.reloadData()
            
            
            
            
             mainviewHeight.constant = 1520 + problemReportingviewHeight.constant + jobCarriedviewHeight.constant + tableviewHeight.constant + invoiceTableviewHeight.constant + paymentTableviewHeight.constant
            
        }else{
        
        
        
        
        
        if let value = param["JobCardNo"] {
            
            jobCard.text = value as? String ?? ""
        }
        
        
        if let value = param["JObCardDetails"] {
            
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                
                
                let stringValue  = obj.object(forKey: "Customer_Name") as? String ?? ""
                
                let valueTechHeight =  stringValue.width(withConstrainedHeight:30 , font: UIFont.systemFont(ofSize: 14, weight:.regular))
                
                
                
                
                
                
                
                let stringValue1  = obj.object(forKey: "Customer_Address") as? String ?? ""
                
                let valueTechHeight1 =  stringValue1.width(withConstrainedHeight:30 , font: UIFont.systemFont(ofSize: 14, weight:.regular))
                
                if valueTechHeight  > self.view.frame.size.width - 60{
                    
                    namewidth.constant = valueTechHeight
                    
                    
                }else{
                    
                    namewidth.constant = self.view.frame.size.width - 40
                }
                if valueTechHeight1  > self.view.frame.size.width - 60{
                    
                    addreesWidth.constant = valueTechHeight1
                    
                    
                }else{
                    
                    addreesWidth.constant = self.view.frame.size.width - 40
                }
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                name.text = stringValue
                contactperson.text = obj.object(forKey: "ContactPerson") as? String ?? ""
                contactNo.text = obj.object(forKey: "Contact_Details") as? String ?? ""
                address.text = stringValue1
                 unitName.text = obj.object(forKey: "V_Make") as? String ?? ""
                unitModel.text = obj.object(forKey: "V_Model") as? String ?? ""
                unitSerial.text = obj.object(forKey: "Serial_Number") as? String ?? ""
                commiDate.text =  ""
                warranty.text = obj.object(forKey: "InOutWarranty") as? String ?? ""
                engineNo.text = obj.object(forKey: "EngineSlNo") as? String ?? ""
                vehicleNo.text = obj.object(forKey: "Vehicle_Number") as? String ?? ""
                engineHours.text = obj.object(forKey: "Engine_Hour") as? String ?? ""
                placeAttended.text = obj.object(forKey: "Place_Attended") as? String ?? ""
                gstNo.text = obj.object(forKey: "Tin_No") as? String ?? ""
                timeOfRepair.text = obj.object(forKey: "V_Repair_Time") as? String ?? ""
                deliveryDate.text =  ""
                
                repairDate.text =  ""
                deliveryTime.text = obj.object(forKey: "V_Delivery_Time") as? String ?? ""
                
                let V_Repair_Date = obj.object(forKey: "V_Repair_Date") as? String ?? ""
                if V_Repair_Date != ""  {
                    repairDate.text = PASSDATE(STRINGDATE: V_Repair_Date)
                }
                let V_Delivery_Date = obj.object(forKey: "V_Delivery_Date") as? String ?? ""
                if V_Delivery_Date != ""  {
                    deliveryDate.text = PASSDATE(STRINGDATE: V_Delivery_Date)
                }
                
                let V_comissioning_Date = obj.object(forKey: "V_comissioning_Date") as? String ?? ""
                if V_comissioning_Date != ""  {
                    commiDate.text = PASSDATE(STRINGDATE: V_comissioning_Date)
                }
                
                
                
                
                
                
                
                
                
            }
        }
        
        
        if let value = param["JobcardReportFindingList"] {
            
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                
                problemReportingDate.text = ""
                
                let Created_Date = obj.object(forKey: "Created_Date") as? String ?? ""
                if Created_Date != ""  {
                    problemReportingDate.text = PASSDATE(STRINGDATE: Created_Date)
                }
                
                problemReporting.text = obj.object(forKey: "ProblemReportFinding") as? String ?? ""
                
                
                let value1 =  problemReporting.text.height(withConstrainedWidth: self.view.frame.size.width - 50, font: UIFont.systemFont(ofSize: 13, weight:.regular))
                if value1 > 1000 {
                    
                    problemReportingviewHeight.constant = 1000
                }else{
                    
                    problemReportingviewHeight.constant = value1 + 40
                    
                }
            }
        }
        
        if let value = param["JobCardCarriedOutList"] {
            
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                
                
                
                jobCarriedDate.text = ""
                
                let Created_Date = obj.object(forKey: "Created_Date") as? String ?? ""
                if Created_Date != ""  {
                    jobCarriedDate.text = PASSDATE(STRINGDATE: Created_Date)
                }
                
                
                
                
                
                
                jobCarried.text = obj.object(forKey: "JobCarried") as? String ?? ""
                let value1 =  jobCarried.text.height(withConstrainedWidth: self.view.frame.size.width - 50, font: UIFont.systemFont(ofSize: 13, weight:.regular))
                if value1 > 1000 {
                    
                    jobCarriedviewHeight.constant = 1000
                }else{
                    
                    jobCarriedviewHeight.constant = value1 + 40
                    
                }
                
                
            }
        }
        if let value = param["JobCardAlreadySavedSpears"] {
            menuListdisplay.removeAll()
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                
                menuListdisplay.append(obj)
                
                
            }
            tableviewHeight.constant =       CGFloat(menuListdisplay.count  * 30)
            
            
            
            
            
        }
        
        spareTable.reloadData()
       
        
        
        mainviewHeight.constant = 1520 + problemReportingviewHeight.constant + jobCarriedviewHeight.constant + tableviewHeight.constant
        
        serviceCalldata()
        
    }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serviceCall()
        problemReportingviewHeight.constant = 0
        jobCarriedviewHeight.constant = 0
        tableviewHeight.constant = 0
        invoiceTableviewHeight.constant = 0
          paymentTableviewHeight.constant = 0
        
        mainviewHeight.constant = 1520
        spareTable.tableFooterView = UIView(frame: .zero)
         invoiceTable.tableFooterView = UIView(frame: .zero)
          paymentTable.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == spareTable {
        
        
        return menuListdisplay.count
        }else  if tableView == paymentTable {
            return paymentListdisplay.count
        }else{
            return invoiceListdisplay.count
        }
        
    }
    
    
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
        
        
        
        return 30.0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        var cell = FinaceFormTVCell()

        
        
         var model : NSDictionary
        
        
        if tableView == spareTable {
        
       model  = menuListdisplay[indexPath.row]
            cell = spareTable.dequeueReusableCell(withIdentifier: "FinaceFormID", for: indexPath ) as! FinaceFormTVCell
            
            
            
            
            configurejobdisplayCell(cell: cell,forrowatindepath:indexPath as NSIndexPath, passingDict: model)
        
        }else if tableView == paymentTable {
            
            cell = paymentTable.dequeueReusableCell(withIdentifier: "FinaceFormPaymentID", for: indexPath ) as! FinaceFormTVCell
            
            model  = paymentListdisplay[indexPath.row]
            
            configurejobdisplayCellPasspay(cell: cell,forrowatindepath:indexPath as NSIndexPath, passingDict: model)
            
        }else{
            
            cell = invoiceTable.dequeueReusableCell(withIdentifier: "FinaceFormInvoiceID", for: indexPath ) as! FinaceFormTVCell
            
             model  = invoiceListdisplay[indexPath.row]
            
            configurejobdisplayCellPass(cell: cell,forrowatindepath:indexPath as NSIndexPath, passingDict: model)
        }
        
        
        
        return cell

        
        
    }
    
    
    
    func configurejobdisplayCell(cell:FinaceFormTVCell,forrowatindepath indexPath:NSIndexPath, passingDict model:NSDictionary){
        
        
        
        cell.spareHead.text = model.object(forKey: "Product_Name") as? String ?? ""
        
        if let totalfup = (model["Quantity"] as? NSString)?.doubleValue {
            
               cell.spareCount.text =  "\(totalfup)"
            
        }
        
        
     
     
        
        cell.spareRem.text = model.object(forKey: "Description") as? String ?? ""
        
        
        
        
    }
    
    func configurejobdisplayCellPass(cell:FinaceFormTVCell,forrowatindepath indexPath:NSIndexPath, passingDict model:NSDictionary){
        
        
        
        cell.spareHead.text = model.object(forKey: "Invoice_Number") as? String ?? ""
        
        let menu_Id : Float32 = model.object(forKey: "Total_Amount")as? Float32 ?? 0.0
        cell.spareCount.text = model.object(forKey: "Invoice_Date") as? String ?? ""
        
        cell.spareRem.text = "\(menu_Id)"
        
        
        
        
    }
    
    func configurejobdisplayCellPasspay(cell:FinaceFormTVCell,forrowatindepath indexPath:NSIndexPath, passingDict model:NSDictionary){
        
        
        
        cell.spareHead.text = model.object(forKey: "PaymentMode") as? String ?? ""
        
        let menu_Id : Float32 = model.object(forKey: "Payment_Details_Amount")as? Float32 ?? 0.0
        cell.spareCount.text = model.object(forKey: "Payment_Details_Date") as? String ?? ""
        
        cell.spareRem.text = "\(menu_Id)"
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
extension FinaceReportVC{
    
    
    func ServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Service_Id":seguefromModel.Service_Id]
        return parameters as [String : Any]
        
    }
}
