//
//  VechicleListdetailVC.swift
//  TransACNR
//
//  Created by Monish M S on 28/05/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class VechicleListdetailVC:  UIViewController ,UITableViewDataSource, UITableViewDelegate ,GetResultResponse{
  
    @IBOutlet weak var subListTableView: UITableView!
    @IBOutlet weak var  ListHead: UILabel!
    var seguefromModel :DetailModel = DetailModel()
    var passFunctionality : String = ""
    var passFunctionalityHead : String = ""
    
     var segueOrderModel :orderModelList = orderModelList()
    var tabledata : [String] = []
    var tableDetails : [String] = []
    
      let functionCall = GetRespone()
    
    
    func serviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNREditOrViewServiceEnquiry as NSString)
    }
    func GetServiceRespone(param: NSDictionary) {
        if let value = param["ServiceDetaills"] {
            
            let objPASS = value as! NSArray
            
            
            let obj = objPASS[0] as! NSDictionary
            
            tableDetails.removeLast()
            tableDetails.removeLast()
            tableDetails.removeLast()
            tableDetails.removeLast()
            tableDetails.removeLast()
            tableDetails.removeLast()
            tableDetails.removeLast()
            tableDetails.removeLast()
            tableDetails.removeLast()
            tableDetails.removeLast()
            tableDetails.removeLast()
            tableDetails.append (obj .object(forKey: "Customer_Code") as! String)
            tableDetails.append (obj .object(forKey: "Customer_Address") as! String)
            
            tableDetails.append(obj .object(forKey: "Contact_Details") as! String)
            
            tableDetails.append (obj .object(forKey: "Unit_Model") as! String)
            tableDetails.append (obj .object(forKey: "Serial_Number") as! String)
            
            tableDetails.append(obj .object(forKey: "Engine_Hour") as! String)
            tableDetails.append(obj .object(forKey: "Place_Attended") as! String)
            
            
            tableDetails.append (obj .object(forKey: "Entry_time") as! String)
            tableDetails.append (obj .object(forKey: "Details_of_Job") as! String)

            tableDetails.append(obj .object(forKey: "ContactPerson") as! String)
            tableDetails.append(obj .object(forKey: "Remarks") as! String)
            
            
              if passFunctionality == "ServiceEnquiryList" {
              
                tableDetails[0] = obj .object(forKey: "ServiceEnquiryNo") as? String ?? ""
                tableDetails[1] = obj .object(forKey: "Customer_Name") as? String ?? ""
                tableDetails[2] = obj .object(forKey: "Type_of_Service") as? String ?? ""
                tableDetails[5] = obj .object(forKey: "Registration_No") as? String ?? ""
           
              
                
                
           
               
                
             
            }
            
              else  if passFunctionality == "ServiceList" {
                
               
                
           
                
                
                tableDetails[0] = obj .object(forKey: "ServiceEnquiryNo") as? String ?? ""
                tableDetails[1] = obj .object(forKey: "Customer_Name") as? String ?? ""
                tableDetails[2] = obj .object(forKey: "Type_of_Service") as? String ?? ""
                
                tableDetails[8] = obj .object(forKey: "Created_Date") as? String ?? ""
          
               
                
                
             
                
                
                
            }
              else  if passFunctionality == "Billable/NonBillable" {
                
             
                
             
                
              
                
                
                tableDetails[1] = obj .object(forKey: "ServiceEnquiryNo") as? String ?? ""
                tableDetails[2] = obj .object(forKey: "Customer_Name") as? String ?? ""
                tableDetails[3] = obj .object(forKey: "Type_of_Service") as? String ?? ""
                
      
             
                
                
             
                
                
                
            }
              else  if passFunctionality == "Finance" {
                
             
                
                
                
                
                tableDetails[1] = obj .object(forKey: "ServiceEnquiryNo") as? String ?? ""
                tableDetails[2] = obj .object(forKey: "Customer_Name") as? String ?? ""
                tableDetails[3] = obj .object(forKey: "Type_of_Service") as? String ?? ""
                
                
                
                
                
                
                
                
                
            }
            
            subListTableView.reloadData()
            
            
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
      

        
          if passFunctionality == "ServiceEnquiryList" {
        
            ListHead.text = "Service Enquiry List Details"
            
tabledata =  ["Service Enquiry","Customer Name","Type of Service","Assigned To","Customer Status","Vehicle Number","Complaint Type","Customer App Status","Customer Code","Customer Address","Mobile Number","Unit Model","Serial Number","Engine Hour","Place Attended","Entry Time","Details of Job","Contact Person","Remarks"]
            
           
            tableDetails.append(seguefromModel.detailServiceEnquiry)
            tableDetails.append(seguefromModel.detailCustomerName)
            tableDetails.append(seguefromModel.detailTypeofService)
            tableDetails.append(seguefromModel.detailAssignedTo)
            tableDetails.append(seguefromModel.detailCustomerStatus)
            tableDetails.append(seguefromModel.detailActiveStatus)
            tableDetails.append(seguefromModel.detailComplaintType)
            tableDetails.append(seguefromModel.detailJobcardNumber)
            tableDetails.append(seguefromModel.detailCustomerCode)
            tableDetails.append(seguefromModel.detailCustomerAddress)
            tableDetails.append(seguefromModel.detailMobileNumber)
            tableDetails.append(seguefromModel.detailUnitModel)
            tableDetails.append(seguefromModel.detailSerialNumber)
            tableDetails.append(seguefromModel.detailEngineHour)
            tableDetails.append(seguefromModel.detailPlaceAttended)
            tableDetails.append(seguefromModel.detailEntryTime)
            tableDetails.append(seguefromModel.detailDetailsofJob)
            tableDetails.append(seguefromModel.detailContactPerson)
            tableDetails.append(seguefromModel.detailRemarks)
            
            
            
        }else  if passFunctionality == "ServiceList" {
        
             ListHead.text = "Service List Details"
            
            tabledata =  ["Service Enquiry","Customer Name","Type of Service","Jobcard Number","Assigned To","Customer Status","Active Status","Complaint Type","Created Date","Customer Code","Customer Address","Mobile Number","Unit Model","Serial Number","Engine Hour","Place Attended","Entry Time","Details of Job","Contact Person","Remarks"]
            
            
            tableDetails.append(seguefromModel.detailServiceEnquiry)
            tableDetails.append(seguefromModel.detailCustomerName)
            tableDetails.append(seguefromModel.detailTypeofService)
            
             tableDetails.append(seguefromModel.detailJobcardNumber)
            tableDetails.append(seguefromModel.detailAssignedTo)
            tableDetails.append(seguefromModel.detailCustomerStatus)
            tableDetails.append(seguefromModel.detailActiveStatus)
            tableDetails.append(seguefromModel.detailComplaintType)
            tableDetails.append(seguefromModel.detailPlaceAttended)
            tableDetails.append(seguefromModel.detailCustomerCode)
            tableDetails.append(seguefromModel.detailCustomerAddress)
            tableDetails.append(seguefromModel.detailMobileNumber)
            tableDetails.append(seguefromModel.detailUnitModel)
            tableDetails.append(seguefromModel.detailSerialNumber)
            tableDetails.append(seguefromModel.detailEngineHour)
            tableDetails.append("")
            tableDetails.append(seguefromModel.detailEntryTime)
            tableDetails.append(seguefromModel.detailDetailsofJob)
            tableDetails.append(seguefromModel.detailContactPerson)
            tableDetails.append(seguefromModel.detailRemarks)
            
            
            
        }
          else  if passFunctionality == "Billable/NonBillable" {
            
            ListHead.text = "Billable / NonBillable Details"
            
            tabledata =  ["Jobcard Number","Service Enquiry","Customer Name","Type of Service","Assigned To","Customer Status","Active Status","Complaint Type","Customer Code","Customer Address","Mobile Number","Unit Model","Serial Number","Engine Hour","Place Attended","Entry Time","Details of Job","Contact Person","Remarks"]
            
            tableDetails.append(seguefromModel.detailJobcardNumber)

            tableDetails.append(seguefromModel.detailServiceEnquiry)
            tableDetails.append(seguefromModel.detailCustomerName)
            tableDetails.append(seguefromModel.detailTypeofService)
            
            
            tableDetails.append(seguefromModel.detailAssignedTo)
            tableDetails.append(seguefromModel.detailCustomerStatus)
            tableDetails.append(seguefromModel.detailActiveStatus)
            tableDetails.append(seguefromModel.detailComplaintType)
           
            tableDetails.append(seguefromModel.detailCustomerCode)
            tableDetails.append(seguefromModel.detailCustomerAddress)
            tableDetails.append(seguefromModel.detailMobileNumber)
            tableDetails.append(seguefromModel.detailUnitModel)
            tableDetails.append(seguefromModel.detailSerialNumber)
            tableDetails.append(seguefromModel.detailEngineHour)
            tableDetails.append("")
            tableDetails.append(seguefromModel.detailEntryTime)
            tableDetails.append(seguefromModel.detailDetailsofJob)
            tableDetails.append(seguefromModel.detailContactPerson)
            tableDetails.append(seguefromModel.detailRemarks)
            
            
            
        }
          else  if passFunctionality == "Finance" {
            
            ListHead.text = "Finance Details"
            
            tabledata =  ["Jobcard Number","Service Enquiry","Customer Name","Type of Service","Assigned To","Customer Status","Active Status","Complaint Type","Customer Code","Customer Address","Mobile Number","Unit Model","Serial Number","Engine Hour","Place Attended","Entry Time","Details of Job","Contact Person","Remarks"]
            
            tableDetails.append(seguefromModel.detailJobcardNumber)
            
            tableDetails.append(seguefromModel.detailServiceEnquiry)
            tableDetails.append(seguefromModel.detailCustomerName)
            tableDetails.append(seguefromModel.detailTypeofService)
            
            
            tableDetails.append(seguefromModel.detailAssignedTo)
            tableDetails.append(seguefromModel.detailCustomerStatus)
            tableDetails.append(seguefromModel.detailActiveStatus)
            tableDetails.append(seguefromModel.detailComplaintType)
            
            tableDetails.append(seguefromModel.detailCustomerCode)
            tableDetails.append(seguefromModel.detailCustomerAddress)
            tableDetails.append(seguefromModel.detailMobileNumber)
            tableDetails.append(seguefromModel.detailUnitModel)
            tableDetails.append(seguefromModel.detailSerialNumber)
            tableDetails.append(seguefromModel.detailEngineHour)
            tableDetails.append("")
            tableDetails.append(seguefromModel.detailEntryTime)
            tableDetails.append(seguefromModel.detailDetailsofJob)
            tableDetails.append(seguefromModel.detailContactPerson)
            tableDetails.append(seguefromModel.detailRemarks)
            
            
            
        }
         else  if passFunctionality == "Order Transfer List" {
            
            ListHead.text = "Order Transfer Details"
            
            tabledata =  ["Order Intend No","Customer Name","Customer Code","Enquiry Type","Unit Model","Approval Status","Created Date"]
            
            
            tableDetails.append(segueOrderModel.Order_Order_Intend_No)
            tableDetails.append(segueOrderModel.Order_Customer_Name)
            tableDetails.append(segueOrderModel.Order_Cust_Code)
            
            
            tableDetails.append(segueOrderModel.Order_Enquiry_Type)
            tableDetails.append(segueOrderModel.Order_Unit_Model)
            tableDetails.append(segueOrderModel.Order_Approval_Status)
            tableDetails.append(segueOrderModel.Order_CreatedDate)
            
          } else  if passFunctionality == "Order payment Status" {
            
            ListHead.text = "Order payment Status Details"
            
            tabledata =  ["Order Intend No","Customer Code","Customer Name","Unit Model","Enquiry Type","Approval Status","Quantity","Price","Total Amount","Paid Amount","Balance Amount"]
            
            
            tableDetails.append(segueOrderModel.Order_Order_Intend_No)
           
            tableDetails.append(segueOrderModel.Order_Cust_Code)
             tableDetails.append(segueOrderModel.Order_Customer_Name)
            tableDetails.append(segueOrderModel.Order_Unit_Model)
            tableDetails.append(segueOrderModel.Order_Enquiry_Type)
            
            tableDetails.append(segueOrderModel.Order_Approval_Status)
            tableDetails.append(segueOrderModel.Order_CreatedDate)
            
            
            tableDetails.append(segueOrderModel.Order_AssignedTo_Name)
            tableDetails.append(segueOrderModel.Order_Total)
            tableDetails.append(segueOrderModel.Order_Paid)
            tableDetails.append(segueOrderModel.Order_date)
            
        }
        
          
          else  if passFunctionality == "Order List" {
            
            ListHead.text = "Order List Details"
            
            tabledata =  ["Order Intend No","Customer Name","Customer Code","Enquiry Type","Unit Model","Approval Status","Created Date"]
            
            
            tableDetails.append(segueOrderModel.Order_Order_Intend_No)
            tableDetails.append(segueOrderModel.Order_Customer_Name)
            tableDetails.append(segueOrderModel.Order_Cust_Code)
            
            
            tableDetails.append(segueOrderModel.Order_Enquiry_Type)
            tableDetails.append(segueOrderModel.Order_Unit_Model)
            tableDetails.append(segueOrderModel.Order_Approval_Status)
            tableDetails.append(segueOrderModel.Order_CreatedDate)
            
        }
          else  if passFunctionality == "Order Pending List" {
            
            ListHead.text = "Order Pending  Details"
            
            tabledata =  ["Order Date","Order Intend No","Customer Name","Customer Code","Enquiry Type","Unit Model","Approval Status","Enquiry Date","Total Price","Pending Qunatity"]
             tableDetails.append(segueOrderModel.Order_date)
            tableDetails.append(segueOrderModel.Order_Order_Intend_No)
            tableDetails.append(segueOrderModel.Order_Customer_Name)
            tableDetails.append(segueOrderModel.Order_Cust_Code)
            
            
            tableDetails.append(segueOrderModel.Order_Enquiry_Type)
            tableDetails.append(segueOrderModel.Order_Unit_Model)
            tableDetails.append(segueOrderModel.Order_Approval_Status)
            tableDetails.append(segueOrderModel.Order_CreatedDate)
            tableDetails.append(segueOrderModel.Order_Total)
            tableDetails.append(segueOrderModel.Order_AssignedTo_Name)
            
        }
          else  if passFunctionality == "Order complete" {
            
            ListHead.text = "Order Complete  Details"
            
            tabledata =  ["Order Number","Customer Name","Place of Installation","Unit Model","POC","Indent Date","Pending Details","Complete Status"]
            tableDetails.append(segueOrderModel.Order_Order_Intend_No)
          
            tableDetails.append(segueOrderModel.Order_Customer_Name)
            tableDetails.append(segueOrderModel.Order_Enquiry_Type)
            
            tableDetails.append(segueOrderModel.Order_Unit_Model)
            tableDetails.append(segueOrderModel.Order_Cust_Code)
            tableDetails.append(segueOrderModel.Order_CreatedDate)
            tableDetails.append(segueOrderModel.Order_Paid)
            tableDetails.append(segueOrderModel.Order_Approval_Status)
            
        }
        
        
        subListTableView.tableFooterView = UIView(frame: .zero)
        
        if  passFunctionalityHead != "order"
        {
        
        
        serviceCall()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backNavigationAction(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return tabledata.count
        
        
    }
    
    
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
        let value1 = tableDetails[indexPath.row].height(withConstrainedWidth: self.view.frame.size.width - 130, font: UIFont.systemFont(ofSize: 13, weight:.regular))
        
        if value1 > 40{
            
            return 10.0 + value1;
        }
        
        
        
        return 50.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = DetailsShowTVCell()
        
        cell = subListTableView.dequeueReusableCell(withIdentifier: "DetailsShow", for: indexPath ) as! DetailsShowTVCell
        
        
        configureMarketdisplayCell(cell: cell,forrowatindepath:indexPath as NSIndexPath)
        
        return cell
    }
    
    func configureMarketdisplayCell(cell:DetailsShowTVCell,forrowatindepath indexPath:NSIndexPath){
        
        
        cell.typeName.text = tabledata[indexPath.row]
        
        cell.typeDetails.text = tableDetails[indexPath.row]
        
    }
   


}
extension VechicleListdetailVC{
    
    
    func ServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Service_Id":seguefromModel.Service_Id]
        return parameters as [String : Any]
        
    }
}
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
