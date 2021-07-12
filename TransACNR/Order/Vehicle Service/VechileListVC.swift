//
//  VechileListVC.swift
//  TransACNR
//
//  Created by Monish M S on 14/05/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class VechileListVC: UIViewController,GetResultResponse,UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate,PinRemoverDelegate{

    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var headingList: UILabel!
    @IBOutlet weak var searchListBar: UISearchBar!
    
    var deleteBool :Bool = false
    var totalCount :Int = 0
    var currentPage :Int = 1
    var passFunctionality : String = ""
    let functionCall = GetRespone()
    var menuListdisplay   =  [DetailModel]()
    var seguetoModel :DetailModel = DetailModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      menuListdisplay.removeAll()
          serviceCall()
        
         if passFunctionality == "ServiceEnquiryList" {
        headingList.text = "Service Enquiry List"
        }
         else  if passFunctionality == "ServiceList" {
            headingList.text = "Service List"
        }
         else  if passFunctionality == "JobCardHistory" {
            headingList.text = "JobCard History"
        }
         else  if passFunctionality == "Billable/NonBillable" {
            headingList.text = "Billable / Non Billable"
        }
         else  if passFunctionality == "Finance" {
            headingList.text = "Finance"
        }
        searchListBar.showsCancelButton = true
        listTableView.tableFooterView = UIView(frame: .zero)
        searchListBar.delegate = self
        
    }
    func removePin() {
        
        menuListdisplay.removeAll()
        serviceCall()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToNavigation(_ sender: Any) {
        
         _ = navigationController?.popViewController(animated: true)
        
    }
    
    
    
    func serviceCallDelete()  {
        
//
       
        MTPopUp(frame: self.view.frame).show(complete: { (index) in
            print("INDEX : \(index)")
           if index == 1 {
            
            self.functionCall.delegete = self
            self.deleteBool = true
            self.functionCall.getserviceCall(param: self.ServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRDeleteServiceEnquiry as NSString)
            }
        },
                                             view: self.view,
                                             animationType: MTAnimation.ZoomIn_ZoomOut,
                                             strMessage: "Are you sure want to delete?",
                                             btnArray: ["Ok","Cancel"],
                                             strTitle: "")
        
        
        
        
    }
    
    func serviceCallInactive()  {
        
        functionCall.delegete = self
        deleteBool = true
        
        functionCall.getserviceCall(param: ServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRVehicleServiceActiveOrInactive as NSString)
        
    
        
        
        
        
    }
    
    
    func serviceCallCompleted()  {
        
        functionCall.delegete = self
        deleteBool = true
        
        functionCall.getserviceCall(param: ServiceCompleteCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRVehicleServiceComplete as NSString)
        
        
        
        
        
        
    }
    
    
    
    
    
    func serviceCall()  {
        
        functionCall.delegete = self
        
                if passFunctionality == "ServiceEnquiryList" {
            functionCall.getserviceCall(param: VechileListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRServiceEnquiryList as NSString)
        }  else  if passFunctionality == "ServiceList" {
            functionCall.getserviceCall(param: VechileListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRServiceList as NSString)
            
            
        }
        else  if passFunctionality == "JobCardHistory" {
                    
                    functionCall.getserviceCall(param: VechileListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRJobCardHistoryList as NSString)
        
                }
                else  if passFunctionality == "Billable/NonBillable" {
                    
                    functionCall.getserviceCall(param: VechileListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRCompleteBillableList as NSString)
                    
        }
                else  if passFunctionality == "Finance" {
                    
                    functionCall.getserviceCall(param: VechileListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRCompleteFinanceList as NSString)
                    
        }
        
        
        
        
        
        
    }
    func GetServiceRespone(param: NSDictionary) {
        
        if deleteBool {
            deleteBool = false
            totalCount = 0
            serviceCall()
            
        }
        else{
        
          if let value = param["TotalCount"] {
            
            let checkTotal = value as! Int
            
            
            if totalCount == checkTotal {
                
                
            }else{
                
                totalCount = checkTotal
                menuListdisplay.removeAll()

            }
        
        }
        
        
        
        
        if let value = param["ServiceEnquiryList"] {
 
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
        
//                let menumodel = VechileListModel(Service_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Service_AssignedTo_Nameinit: obj["AssignedTo"] as? String ?? "", Service_CustomStatusinit: obj["CustomStatus"] as? String ?? "", Service_EnquiryNoinit: obj["ServiceEnquiryNo"] as? String ?? "")
//
                let menu_Id : Int = obj.object(forKey: "Service_Id")as? Int ?? 0
                let stringMenu_Id = "\(menu_Id)"
                
                
                
                
                
                let menumodel = DetailModel(detailService_Idinit:stringMenu_Id, detailJobcardNumberinit: obj["CustomerAppStatus"] as? String ?? "", detailServiceEnquiryinit: obj["ServiceEnquiryNo"] as? String ?? "", detailCustomerNameinit: obj["Customer_Name"] as? String ?? "", detailTypeofServiceinit: obj["Type_of_Service"] as? String ?? "", detailAssignedToinit: obj["AssignedTo"] as? String ?? "", detailCustomerStatusinit: obj["CustomStatus"] as? String ?? "", detailActiveStatusinit: obj["Vehicle_Number"] as? String ?? "", detailComplaintTypeinit: obj["Complaint_Type"] as? String ?? "", detailCustomerCodeinit: obj["Customer_Code"] as? String ?? "", detailCustomerAddressinit: obj["Customer_Address"] as? String ?? "", detailMobileNumberinit: obj["Mobile_No"] as? String ?? "", detailUnitModelinit: obj["Unit_Model"] as? String ?? "", detailSerialNumberinit: obj["Serial_Number"] as? String ?? "", detailEngineHourinit: obj["Engine_Hour"] as? String ?? "", detailPlaceAttendedinit: obj["Place_Attended"] as? String ?? "", detailEntryTimeinit: obj["Entry_Time"] as? String ?? "", detailDetailsofJobinit: obj["Details_of_Job"] as? String ?? "", detailContactPersoninit: obj["ContactPerson"] as? String ?? "", detailRemarksinit: obj["Remarks"] as? String ?? "")

                
                
                
                
                menuListdisplay.append(menumodel)
                
                
                
                
            }
        }
        
        
        
        if let value = param["ServiceList"] {
            
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                let menu_Id : Int = obj.object(forKey: "Service_Id")as? Int ?? 0
                let stringMenu_Id = "\(menu_Id)"
                
                
                
                     let menumodel = DetailModel(detailService_Idinit:stringMenu_Id,detailJobcardNumberinit: obj["Job_Card_No"] as? String ?? "", detailServiceEnquiryinit: obj["ServiceEnquiryNo"] as? String ?? "", detailCustomerNameinit: obj["Customer_Name"] as? String ?? "", detailTypeofServiceinit: obj["Type_of_Service"] as? String ?? "", detailAssignedToinit: obj["AssignedTo"] as? String ?? "", detailCustomerStatusinit: obj["CustomStatus"] as? String ?? "", detailActiveStatusinit: obj["Active_Status"] as? String ?? "", detailComplaintTypeinit: obj["Complaint_Type"] as? String ?? "", detailCustomerCodeinit: obj["Customer_Code"] as? String ?? "", detailCustomerAddressinit: obj["Customer_Address"] as? String ?? "", detailMobileNumberinit: obj["Mobile_No"] as? String ?? "", detailUnitModelinit: obj["Unit_Model"] as? String ?? "", detailSerialNumberinit: obj["Serial_Number"] as? String ?? "", detailEngineHourinit: obj["Engine_Hour"] as? String ?? "", detailPlaceAttendedinit: obj["Created_Date"] as? String ?? "", detailEntryTimeinit: obj["Entry_Time"] as? String ?? "", detailDetailsofJobinit: obj["Details_of_Job"] as? String ?? "", detailContactPersoninit: obj["ContactPerson"] as? String ?? "", detailRemarksinit: obj["Remarks"] as? String ?? "")
                
                
                
                
                
                
                
                
                menuListdisplay.append(menumodel)
                
                
                
                
            }
        }
        if let value = param["JobCardHistoryList"] {
            
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
//                let menumodel = VechileListModel(Service_Customer_Nameinit: obj["Name"] as? String ?? "", Service_AssignedTo_Nameinit: obj["Job_Card_No"] as? String ?? "", Service_CustomStatusinit: obj["CustomStatus"] as? String ?? "", Service_EnquiryNoinit: obj["Vehicle_No"] as? String ?? "")
                let menu_Id : Int = obj.object(forKey: "Service_Id")as? Int ?? 0
                let stringMenu_Id = "\(menu_Id)"
                
                
                
                
                
                     let menumodel = DetailModel(detailService_Idinit:stringMenu_Id,detailJobcardNumberinit: obj["Job_Card_No"] as? String ?? "", detailServiceEnquiryinit: obj["ServiceEnquiryNo"] as? String ?? "", detailCustomerNameinit: obj["Name"] as? String ?? "", detailTypeofServiceinit: obj["Type_of_Service"] as? String ?? "", detailAssignedToinit: obj["AssignedTo"] as? String ?? "", detailCustomerStatusinit: obj["CustomStatus"] as? String ?? "", detailActiveStatusinit: obj["Vehicle_No"] as? String ?? "", detailComplaintTypeinit: obj["Complaint_Type"] as? String ?? "", detailCustomerCodeinit: obj["Customer_Code"] as? String ?? "", detailCustomerAddressinit: obj["Customer_Address"] as? String ?? "", detailMobileNumberinit: obj["Mobile_No"] as? String ?? "", detailUnitModelinit: obj["V_Model"] as? String ?? "", detailSerialNumberinit: obj["V_Serial_No"] as? String ?? "", detailEngineHourinit: obj["Engine_Hour"] as? String ?? "", detailPlaceAttendedinit: obj["Place_Attended"] as? String ?? "", detailEntryTimeinit: obj["Entry_Time"] as? String ?? "", detailDetailsofJobinit: obj["Details_of_Job"] as? String ?? "", detailContactPersoninit: obj["ContactPerson"] as? String ?? "", detailRemarksinit: obj["Remarks"] as? String ?? "")
                
                
                
                
                
                
                
                
                menuListdisplay.append(menumodel)
                 
                
                
                
            }
        }
        
        if let value = param["Service_CompleteBillable"] {
            
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                let menu_Id : Int = obj.object(forKey: "BilledOrNonBilledStatus")as? Int ?? 2
                let stringMenu_Id = "\(menu_Id)"
                
                let menu_Id1 : Int = obj.object(forKey: "Service_Id")as? Int ?? 0
                let stringMenu_Id1 = "\(menu_Id1)"
                
                
                
                
//                let menumodel = VechileListModel(Service_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Service_AssignedTo_Nameinit: obj["ServiceEnquiryNo"] as? String ?? "", Service_CustomStatusinit: stringMenu_Id, Service_EnquiryNoinit: obj["Job_Card_No"] as? String ?? "")
                
                
                
                
                     let menumodel = DetailModel(detailService_Idinit:stringMenu_Id1,detailJobcardNumberinit: obj["Job_Card_No"] as? String ?? "", detailServiceEnquiryinit: obj["ServiceEnquiryNo"] as? String ?? "", detailCustomerNameinit: obj["Customer_Name"] as? String ?? "", detailTypeofServiceinit: obj["Type_of_Service"] as? String ?? "", detailAssignedToinit: obj["AssignedTo"] as? String ?? "", detailCustomerStatusinit: obj["CustomStatus"] as? String ?? "", detailActiveStatusinit: obj["Active_Status"] as? String ?? "", detailComplaintTypeinit: obj["Complaint_Type"] as? String ?? "", detailCustomerCodeinit: obj["Customer_Code"] as? String ?? "", detailCustomerAddressinit: obj["Customer_Address"] as? String ?? "", detailMobileNumberinit: obj["Mobile_No"] as? String ?? "", detailUnitModelinit: obj["Unit_Model"] as? String ?? "", detailSerialNumberinit: obj["Serial_Number"] as? String ?? "", detailEngineHourinit: obj["Engine_Hour"] as? String ?? "", detailPlaceAttendedinit: stringMenu_Id, detailEntryTimeinit: obj["Entry_Time"] as? String ?? "", detailDetailsofJobinit: obj["Details_of_Job"] as? String ?? "", detailContactPersoninit: obj["ContactPerson"] as? String ?? "", detailRemarksinit: obj["Remarks"] as? String ?? "")
                
                menuListdisplay.append(menumodel)
                
                
                
                
            }
        }
        
        if let value = param["Service_CompleteFinance"] {
            
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                let menu_Id : Int = obj.object(forKey: "Service_Id")as? Int ?? 0
                let stringMenu_Id = "\(menu_Id)"
                
                
                
                
                
                
//                let menumodel = VechileListModel(Service_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Service_AssignedTo_Nameinit: obj["ServiceEnquiryNo"] as? String ?? "", Service_CustomStatusinit: "", Service_EnquiryNoinit: obj["Job_Card_No"] as? String ?? "")
                
                
                
                let menumodel = DetailModel(detailService_Idinit:stringMenu_Id,detailJobcardNumberinit: obj["Job_Card_No"] as? String ?? "", detailServiceEnquiryinit: obj["ServiceEnquiryNo"] as? String ?? "", detailCustomerNameinit: obj["Customer_Name"] as? String ?? "", detailTypeofServiceinit: obj["Type_of_Service"] as? String ?? "", detailAssignedToinit: obj["AssignedTo"] as? String ?? "", detailCustomerStatusinit: obj["CustomStatus"] as? String ?? "", detailActiveStatusinit: obj["Active_Status"] as? String ?? "", detailComplaintTypeinit: obj["Complaint_Type"] as? String ?? "", detailCustomerCodeinit: obj["Customer_Code"] as? String ?? "", detailCustomerAddressinit: obj["Customer_Address"] as? String ?? "", detailMobileNumberinit: obj["Mobile_No"] as? String ?? "", detailUnitModelinit: obj["Unit_Model"] as? String ?? "", detailSerialNumberinit: obj["Serial_Number"] as? String ?? "", detailEngineHourinit: obj["Engine_Hour"] as? String ?? "", detailPlaceAttendedinit: "", detailEntryTimeinit: obj["Entry_Time"] as? String ?? "", detailDetailsofJobinit: obj["Details_of_Job"] as? String ?? "", detailContactPersoninit: obj["ContactPerson"] as? String ?? "", detailRemarksinit: obj["Remarks"] as? String ?? "")
                
                menuListdisplay.append(menumodel)
                
                
                
                
            }
        }
        
        
        
        
        
        
        listTableView.reloadData()
        
    }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return menuListdisplay.count
        
        
    }
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == menuListdisplay.count-1 {
            
            if totalCount != menuListdisplay.count{
                
                currentPage =  currentPage + 1
                serviceCall()
                
            }
            
        }
    }
    
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
         let model : DetailModel = menuListdisplay[indexPath.row]
       
        
        if passFunctionality == "JobCardHistory" {
            let value1 =  model.detailCustomerName.height(withConstrainedWidth: self.view.frame.size.width - 35, font: UIFont.systemFont(ofSize: 15, weight:.regular))
        
            
            return 50.0 + value1;
        }else{
             let value1 =  model.detailCustomerName.height(withConstrainedWidth: self.view.frame.size.width - 90, font: UIFont.systemFont(ofSize: 15, weight:.regular))
            return 50.0 + value1;
        }
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
if passFunctionality == "JobCardHistory" {
        
        
        var cell = JobListTVCell()
        
        cell = listTableView.dequeueReusableCell(withIdentifier: "jobListCell", for: indexPath ) as! JobListTVCell
        
        
        configurejobdisplayCell(cell: cell,forrowatindepath:indexPath as NSIndexPath)
        
        return cell
    
}else{
    
    var cell = VechileListTVCell()
    
    cell = listTableView.dequeueReusableCell(withIdentifier: "vechicleListCell", for: indexPath ) as! VechileListTVCell
    
    
    configureMarketdisplayCell(cell: cell,forrowatindepath:indexPath as NSIndexPath)
    
    return cell
    
    
        }
    }
    
    
    
    func configurejobdisplayCell(cell:JobListTVCell,forrowatindepath indexPath:NSIndexPath){
        
        let model : DetailModel = menuListdisplay[indexPath.row]
        
        cell.customerName.text = model.detailCustomerName
        cell.vechilenumber.text = model.detailActiveStatus

        cell.serviceNumber.text = model.detailJobcardNumber

     cell.serviceStatus.text = model.detailCustomerStatus.uppercased()
         if model.detailCustomerStatus == "In Progress" {
            cell.serviceStatus.textColor = UIColor(red:0.95, green:0.20, blue:0.01, alpha:1.00)
         }else if model.detailCustomerStatus == "Solved" {
            cell.serviceStatus.textColor = UIColor(red:0.10, green:0.50, blue:0.01, alpha:1.00)
         }else{
            
            cell.serviceStatus.textColor = .gray
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func configureMarketdisplayCell(cell:VechileListTVCell,forrowatindepath indexPath:NSIndexPath){
        
        let model : DetailModel = menuListdisplay[indexPath.row]
        
        cell.radioButton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
        cell.radioButton.tag = indexPath.row
        cell.radioButton.isEnabled = true
         if passFunctionality == "ServiceEnquiryList" {
        
            cell.customerName.text = model.detailCustomerName
            cell.assignedToName.text = model.detailAssignedTo
            
            cell.serviceName.text = model.detailServiceEnquiry
            
            
            
            
            
            
        if model.detailCustomerStatus == "In Progress" {
            
            cell.colorImage.image = #imageLiteral(resourceName: "bluetick")
            
        }else{
            
            cell.colorImage.image = #imageLiteral(resourceName: "redtick")
        }
        
         }else   if passFunctionality == "Billable/NonBillable" {
            
            
            cell.customerName.text = model.detailCustomerName
            cell.assignedToName.text = model.detailServiceEnquiry
            
            cell.serviceName.text = model.detailJobcardNumber
            
            
            
            
            
            
            
            if model.detailPlaceAttended == "1" {
                
                cell.colorImage.image = #imageLiteral(resourceName: "greenDot")
                
                cell.radioButton.isEnabled = false
                
            }else if model.detailPlaceAttended == "0"{
                
                cell.colorImage.image = #imageLiteral(resourceName: "redDot")
                
                cell.radioButton.isEnabled = false
            }else{
                cell.radioButton.isEnabled = true
                cell.colorImage.image = #imageLiteral(resourceName: "ashDot")
            }
            
         }
         else   if passFunctionality == "Finance" {
            
            cell.customerName.text = model.detailCustomerName
            cell.assignedToName.text = model.detailServiceEnquiry
            
            cell.serviceName.text = model.detailJobcardNumber
                
                cell.colorImage.isHidden = true
                
            
         }
         
         
         
         
         else{
            
            
            cell.customerName.text = model.detailCustomerName
            cell.assignedToName.text = model.detailJobcardNumber
            
            cell.serviceName.text = model.detailServiceEnquiry
            
            
            if model.detailCustomerStatus == "Solved" {
                cell.radioButton.isEnabled = false
                cell.colorImage.image = #imageLiteral(resourceName: "greentick")
                
            }else if model.detailCustomerStatus == "Cancelled"{
                cell.radioButton.isEnabled = false
                cell.colorImage.image = #imageLiteral(resourceName: "redtick")
            }else{
                cell.radioButton.isEnabled = true
                cell.colorImage.image = #imageLiteral(resourceName: "bluetick")
            }
            
            
        }

        
    }
    
    @objc func connected(sender: UIButton){
        let buttonTag = sender.tag
        self.seguetoModel = self.menuListdisplay[buttonTag]
        
        
            let selectedImage = UIImage(named: "ic_checkbox_empty")

        let deselectedImage = UIImage(named: "ic_checkbox_selected")
         sender.setImage(deselectedImage, for: .normal)
//        let actionSheetController: UIAlertController = UIAlertController(title: "", message: "", preferredStyle:.actionSheet)
//
//        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
//
//
//
//
//            sender.setImage(selectedImage, for: .normal)
//        }
//        actionSheetController.addAction(cancelActionButton)
        
        
        
        
          if passFunctionality == "ServiceEnquiryList" {
        
            let actionSheetController: UIAlertController = UIAlertController(title: "", message: "", preferredStyle:.actionSheet)
            
            let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                
                
                
                
                sender.setImage(selectedImage, for: .normal)
            }
            actionSheetController.addAction(cancelActionButton)
        
        
        let saveActionButton = UIAlertAction(title: "Confirm and Assign Technician", style: .default)
        { _ in
            sender.setImage(selectedImage, for: .normal)
            
            
            let popOverVC = UIStoryboard(name: "Technician", bundle: nil).instantiateViewController(withIdentifier: "assignTechnicianVCID") as! AssignTechnicianVC
            
            
            popOverVC.seguetoModel = self.seguetoModel
            popOverVC.delegate = self
            self.addChildViewController(popOverVC)
            
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
            
        }
        actionSheetController.addAction(saveActionButton)
        
        let editActionButton = UIAlertAction(title: "Edit Service Enquiry", style: .default)
        { _ in
            
             sender.setImage(selectedImage, for: .normal)
            
            let storyboard: UIStoryboard = UIStoryboard(name: "ServiceRegistration", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "serviceRegistrationID") as! ServiceRegistrationVC
            
            
            
            
            
            vc.seguefromModel = self.seguetoModel
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
       actionSheetController.addAction(editActionButton)
        let deleteActionButton = UIAlertAction(title: "Delete Service Enquiry", style: .default)
        { _ in
            
            sender.setImage(selectedImage, for: .normal)
            self.serviceCallDelete()
        }
        
        
            actionSheetController.addAction(deleteActionButton)
         self.present(actionSheetController, animated: true, completion: nil)
          }
          
//          else   if passFunctionality == "ServiceList" {
//
//
//
//
//            let saveActionButton = UIAlertAction(title: "InActive", style: .default)
//            { _ in
//                sender.setImage(selectedImage, for: .normal)
//
//                self.serviceCallInactive()
//            }
//            actionSheetController.addAction(saveActionButton)
//
//            let editActionButton = UIAlertAction(title: "Service Complete", style: .default)
//            { _ in
//
//                sender.setImage(selectedImage, for: .normal)
//                self.serviceCallCompleted()
//            }
//            actionSheetController.addAction(editActionButton)
//            let deleteActionButton = UIAlertAction(title: "Job Card", style: .default)
//            { _ in
//                print("Job Card")
//
//                    sender.setImage(selectedImage, for: .normal)
//
//                let storyboard: UIStoryboard = UIStoryboard(name: "JobCard", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "jobCardID") as! JobCardVC
//
//
//
//
//
//                 vc.seguefromModel = self.seguetoModel
//
//                self.navigationController?.pushViewController(vc, animated: true)
//
//
//            }
//
//
//            actionSheetController.addAction(deleteActionButton)
//
//        }
//
//          else   if passFunctionality == "Billable/NonBillable" {
//
//
//
//
//            let saveActionButton = UIAlertAction(title: "Billable/ Non-Billable", style: .default)
//            { _ in
//                print("InActive")
//            }
//            actionSheetController.addAction(saveActionButton)
//
//            let editActionButton = UIAlertAction(title: "Generate FA Report", style: .default)
//            { _ in
//                print("Service Complete")
//            }
//            actionSheetController.addAction(editActionButton)
//            let deleteActionButton = UIAlertAction(title: "Job Card", style: .default)
//            { _ in
//                let storyboard: UIStoryboard = UIStoryboard(name: "JobCardHistory", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "JobcardHistoryID") as! JobcardHistoryViewController
//
//
//
//
//
//                vc.seguefromModel = self.seguetoModel
//
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//
//
//            actionSheetController.addAction(deleteActionButton)
//
//        }
//          else   if passFunctionality == "Finance" {
//
//
//
//
//            let saveActionButton = UIAlertAction(title: "Finance Form", style: .default)
//            { _ in
//
//                sender.setImage(selectedImage, for: .normal)
//
//                let storyboard: UIStoryboard = UIStoryboard(name: "FinanceForm", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "FinanceFormID") as! FinanceFormVC
//
//
//
//
//
//                vc.seguefromModel = self.seguetoModel
//
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            actionSheetController.addAction(saveActionButton)
//
//
//
//        }
        
 //       self.present(actionSheetController, animated: true, completion: nil)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       searchListBar.resignFirstResponder()
        currentPage = 1
        serviceCall()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchListBar.resignFirstResponder()
        
        currentPage = 1
        serviceCall()
        
    }
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        seguetoModel = menuListdisplay[indexPath.row]
        
        
        
        
      if passFunctionality == "JobCardHistory" {
        
        
        
        
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "JobCardHistory", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "JobcardHistoryID") as! JobcardHistoryViewController
        
        
        
        
        
        vc.seguefromModel = self.seguetoModel
        
        self.navigationController?.pushViewController(vc, animated: true)
        
      }else{
        
           performSegue(withIdentifier: "detailsSegue", sender: self)
        
        }
            
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
          if (segue.identifier == "detailsSegue") {
        
        
            let secondViewController = segue.destination as! VechicleListdetailVC
            
            secondViewController.seguefromModel = seguetoModel
     
          secondViewController.passFunctionality = passFunctionality
                
        }
          
         
    }
    
    
    
    
    
}
extension VechileListVC{
    
    
    func VechileListServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["PageSize":"20","BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"CurrentPage":currentPage,"SearchKeyWord":searchListBar.text ?? ""]
        return parameters as [String : Any]
        
    }
    
    func ServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Service_Id":self.seguetoModel.Service_Id!]
        return parameters as [String : Any]
        
    }
    func ServiceCompleteCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Service_Id":self.seguetoModel.Service_Id!,"User_Id":userDefaults.GET_USERDEFAULTS(objectValue:"UserId")]
        return parameters as [String : Any]
        
    }
    
    
    
    
}
