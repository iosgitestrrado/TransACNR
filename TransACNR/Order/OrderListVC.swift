//
//  OrderListVC.swift
//  TransACNR
//
//  Created by Monish M S on 01/08/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class OrderListVC: UIViewController,GetResultResponse,UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate{
        
        @IBOutlet weak var listTableView: UITableView!
        @IBOutlet weak var headingList: UILabel!
        @IBOutlet weak var searchListBar: UISearchBar!
        var seguefromModel :MenuDisplayModel = MenuDisplayModel()
        var deleteBool :Bool = false
        var totalCount :Int = 0
        var currentPage :Int = 1
  
        let functionCall = GetRespone()
        var menuListdisplay   =  [orderModelList]()
        var seguetoModel :orderModelList = orderModelList()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            menuListdisplay.removeAll()
        
            
        
            headingList.text = seguefromModel.menu_Name
               serviceCall()
            searchListBar.showsCancelButton = true
            listTableView.tableFooterView = UIView(frame: .zero)
            searchListBar.delegate = self
            
        }
    
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func backToNavigation(_ sender: Any) {
            
            _ = navigationController?.popViewController(animated: true)
            
        }
        
        
        
        func serviceCallDelete()  {
            
            functionCall.delegete = self
            deleteBool = true
     //       functionCall.getserviceCall(param: OrderCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRDeleteServiceEnquiry as NSString)
            
            
            
            
            
            
            
        }
        
        func serviceCallInactive()  {
            
            functionCall.delegete = self
            deleteBool = true
            
           // functionCall.getserviceCall(param: OrderCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRVehicleServiceActiveOrInactive as NSString)
            
            
            
            
            
            
        }
        
        
        func serviceCallCompleted()  {
            
            functionCall.delegete = self
            deleteBool = true
            
           // functionCall.getserviceCall(param: OrderCompleteCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRVehicleServiceComplete as NSString)
            
            
            
            
            
            
        }
        
        
        
        
        
        func serviceCall()  {
            
            functionCall.delegete = self
            
            
            
            if headingList.text == "Order Transfer List" {
             
               functionCall.getserviceCall(param: OrderListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNROrderTransferlist as NSString)
            }else if headingList.text == "Order payment Status"
            {
                
                functionCall.getserviceCall(param: OrderListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNROrderPaymentStatus as NSString)
            }
            else if headingList.text == "Order complete"
            {
                
                functionCall.getserviceCall(param: OrderListCompleteServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNROrderCompleteList as NSString)
            }
                
                
                
                
            else if headingList.text == "Order List"
            {
                
                functionCall.getserviceCall(param: OrderListSortingServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNROrderList as NSString)
            }
                
                
            else if headingList.text == "Order Pending List"
            {
                
                functionCall.getserviceCall(param: OrderListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNROrderPendingList as NSString)
            }
            else if headingList.text == "Vehicle Warranty"
            {
                
                functionCall.getserviceCall(param: OrderListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRVehicleWarrantyList as NSString)
            }
            else if headingList.text == "AMC"
            {
                
                functionCall.getserviceCall(param: OrderListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNROrderAMCList as NSString)
            }
            else if headingList.text == "Payment Collection List"
            {
                
                functionCall.getserviceCall(param: OrderListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNROrderPaymentList as NSString)
            }
            else if headingList.text == "Payment Due Report"
            {
                
                functionCall.getserviceCall(param: OrderListPaymentDueReportServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRPaymentDueReport as NSString)
            }
                
                
            else if headingList.text == "Payment Collection Report"
            {
                
                functionCall.getserviceCall(param: OrderListPaymentDueReportServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNROrderPaymentCollectionReport as NSString)
            }
                
            else if headingList.text == "Installation List For Approval"
            {
                
                functionCall.getserviceCall(param: InstallationListSortingServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRInstallationForAppproval as NSString)
            }
                
            else if headingList.text == "Installation List For Status"
            {
                
                functionCall.getserviceCall(param: InstallationListSortingServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRInstallationForAppproval as NSString)
            }
            else if headingList.text == "Order List Details Report"
            {
                
                functionCall.getserviceCall(param: InstallationListSortingServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNROrderListDetailsReport as NSString)
            }
                
            else if headingList.text == "Order List Report"
            {
                
                functionCall.getserviceCall(param: OrderListReportServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNROrderListReport as NSString)
            }
             
            else if headingList.text == "Order Complete SubOrder"
            {
                
                functionCall.getserviceCall(param: OrderListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNROrderCompleteSubOrder as NSString)
            }
                
            else if headingList.text == "Dispatch Request List"
            {
                
                functionCall.getserviceCall(param: DispatchServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRDispatchRequestList as NSString)
            }
                
                
 
            
            
            
            
        }
        func GetServiceRespone(param: NSDictionary) {
            
       
         
            if let value = param["TotalCount"] {
                
                let checkTotal = value as! Int
                
                
                if totalCount == checkTotal {
                    
                    
                }else{
                    
                    totalCount = checkTotal
                    menuListdisplay.removeAll()
                    
                }
                
            }
                
                
                if let value = param["OrderTransferList"] {
                    
                    for item in value as! Array<Any> {
                        
                        let obj = item as! NSDictionary
                        
                      
                        let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                        let stringMenu_Id = "\(menu_Id)"
                
                        
                        let menumodel = orderModelList(Order_Customer_Nameinit: obj["Cust_Name"] as? String ?? "", Order_AssignedTo_Nameinit: obj["Approval_Status"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_Intend_No"] as? String ?? "", Order_CreatedDateinit: obj["CreatedDate"] as? String ?? "", Order_Cust_Codeinit: obj["Cust_Code"] as? String ?? "", Order_Enquiry_Typeinit: obj["Enquiry_Type"] as? String ?? "", Order_Unit_Modelinit: obj["Unit_Model"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["Approval_Status"] as? String ?? "", Order_dateinit :"", Order_Totalinit :"", Order_Paidinit :"")
                        
                        
                        
                        
                        menuListdisplay.append(menumodel)
                        
                        
                        
                        
                    }
                }
            if let value = param["OrderPaymentStatusList"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    
                    let Quantity : Int = obj.object(forKey: "Quantity")as? Int ?? 0
                    let stringQuantity = "\(Quantity)"
                    let Total_Amount : Int = obj.object(forKey: "Total_Amount")as? Int ?? 0
                    let stringTotal_Amount = "\(Total_Amount)"
                    let Price : Int = obj.object(forKey: "Price")as? Int ?? 0
                    let stringPrice = "\(Price)"
                    let Balence_Amount : Int = obj.object(forKey: "Balence_Amount")as? Int ?? 0
                    let stringBalence_Amount = "\(Balence_Amount)"
                    let Paid_Amount : Int = obj.object(forKey: "Paid_Amount")as? Int ?? 0
                    let stringPaid_Amount = "\(Paid_Amount)"
                    
                    
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Cust_Name"] as? String ?? "", Order_AssignedTo_Nameinit: stringPrice, Order_Order_Intend_Noinit: obj["Order_Intend_No"] as? String ?? "", Order_CreatedDateinit: stringQuantity, Order_Cust_Codeinit: obj["Cust_Code"] as? String ?? "", Order_Enquiry_Typeinit: obj["Enquiry_Type"] as? String ?? "", Order_Unit_Modelinit: obj["Unit_Model"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["Approval_Status"] as? String ?? "", Order_dateinit :stringBalence_Amount, Order_Totalinit : stringTotal_Amount, Order_Paidinit :stringPaid_Amount)
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            
            if let value = param["OrderListDetailsReport"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: obj["Approval_Status"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_Intend_No"] as? String ?? "", Order_CreatedDateinit: obj["CreatedDate"] as? String ?? "", Order_Cust_Codeinit: obj["Payment_Mode"] as? String ?? "", Order_Enquiry_Typeinit: obj["Enquiry_Type"] as? String ?? "", Order_Unit_Modelinit: obj["Unit_Name"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["NOrmal_Custom_Or_Truck_Custom_Status"] as? String ?? "", Order_dateinit :"", Order_Totalinit :"", Order_Paidinit :"")
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            if let value = param["Payment_Collection_Report"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: obj["Approval_Status"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_Intend_No"] as? String ?? "", Order_CreatedDateinit: obj["CreatedDate"] as? String ?? "", Order_Cust_Codeinit: obj["Payment_Mode"] as? String ?? "", Order_Enquiry_Typeinit: obj["Type_Enquiry"] as? String ?? "", Order_Unit_Modelinit: obj["Unit_Model"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["Approval_Status"] as? String ?? "", Order_dateinit :"", Order_Totalinit :"", Order_Paidinit :"")
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            
            if let value = param["InstallationApprovalList"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: obj["Approval_Status"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_Intend_No"] as? String ?? "", Order_CreatedDateinit: obj["OrderDate"] as? String ?? "", Order_Cust_Codeinit: obj["Payment_Mode"] as? String ?? "", Order_Enquiry_Typeinit: obj["Enquiry_Type"] as? String ?? "", Order_Unit_Modelinit: obj["Unit_Model"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["Approval_Status"] as? String ?? "", Order_dateinit :"", Order_Totalinit :"", Order_Paidinit :"")
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            
            
            
            
            
            if let value = param["OrderPaymentDueport"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: obj["Approval_Status"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_Intend_No"] as? String ?? "", Order_CreatedDateinit: obj["CreatedDate"] as? String ?? "", Order_Cust_Codeinit: obj["Cust_Code"] as? String ?? "", Order_Enquiry_Typeinit: obj["Enquiry_Type"] as? String ?? "", Order_Unit_Modelinit: obj["Unit_Name"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["Approval_Status"] as? String ?? "", Order_dateinit :"", Order_Totalinit :"", Order_Paidinit :"")
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            if let value = param["OrderListReport"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: obj["Approval"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_Intend_No"] as? String ?? "", Order_CreatedDateinit: obj["CreatedDate"] as? String ?? "", Order_Cust_Codeinit: obj["Cust_Code"] as? String ?? "", Order_Enquiry_Typeinit: obj["Enquiry_Type"] as? String ?? "", Order_Unit_Modelinit: obj["Unit_Name"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["Approval_Status"] as? String ?? "", Order_dateinit :"", Order_Totalinit :"", Order_Paidinit :"")
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            
            if let value = param["OrderPendingList"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    let total : Int = obj.object(forKey: "Total_Price")as? Int ?? 0
                    let stringtotal = "\(total)"
                    
                    
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: obj["PendingQty"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_Intend_No"] as? String ?? "", Order_CreatedDateinit: obj["EnqDate"] as? String ?? "", Order_Cust_Codeinit: obj["Customer_Code"] as? String ?? "", Order_Enquiry_Typeinit: obj["Enquiry_Type"] as? String ?? "", Order_Unit_Modelinit: obj["Unit"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["Approval"] as? String ?? "", Order_dateinit :obj["OrderDate"] as? String ?? "", Order_Totalinit :stringtotal, Order_Paidinit :"")
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            
            if let value = param["OrderCompleteList"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                 
                    
                    
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: "", Order_Order_Intend_Noinit: obj["Order_No"] as? String ?? "", Order_CreatedDateinit: obj["Indent_Date"] as? String ?? "", Order_Cust_Codeinit: obj["POC"] as? String ?? "", Order_Enquiry_Typeinit: obj["Place_Of_Installation"] as? String ?? "", Order_Unit_Modelinit: obj["Unit_Model"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["Complete_Status"] as? String ?? "", Order_dateinit :"", Order_Totalinit :"", Order_Paidinit :obj["Pending_Details"] as? String ?? "")
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            
            
            if let value = param["OrderList"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    var stringApproval = "ACTIVE"
                     let Approval_Id : Int = obj.object(forKey: "Active_Status")as? Int ?? 0
                    
                    if Approval_Id == 1 {
                        stringApproval = "ACTIVE"
                    }else{
                        
                        stringApproval = "INACTIVE"
                    }
                    
                    
                    
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: stringApproval, Order_Order_Intend_Noinit: obj["Order_Intend_No"] as? String ?? "", Order_CreatedDateinit: obj["EnqDate"] as? String ?? "", Order_Cust_Codeinit: obj["Customer_Code"] as? String ?? "", Order_Enquiry_Typeinit: obj["Enquiry_Type"] as? String ?? "", Order_Unit_Modelinit: obj["Unit_Name"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["Approval"] as? String ?? "", Order_dateinit :obj["OrderDate"] as? String ?? "", Order_Totalinit :"", Order_Paidinit : "")
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            
            
            
            
            
            
            
            
            
            if let value = param["VehicleWarrantyList"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: obj["Approval_Status"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_Indent_no"] as? String ?? "", Order_CreatedDateinit: obj["CreatedDate"] as? String ?? "", Order_Cust_Codeinit: obj["Cust_Code"] as? String ?? "", Order_Enquiry_Typeinit: obj["Enquiry_Type"] as? String ?? "", Order_Unit_Modelinit: obj["UnitName"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["IN_OUT"] as? String ?? "", Order_dateinit :"", Order_Totalinit :"", Order_Paidinit :"")
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            
            if let value = param["AMCList"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: obj["Approval_Status"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_Indent_no"] as? String ?? "", Order_CreatedDateinit: obj["Fromdate"] as? String ?? "", Order_Cust_Codeinit: obj["Cust_Code"] as? String ?? "", Order_Enquiry_Typeinit: obj["Enquiry_Type"] as? String ?? "", Order_Unit_Modelinit: obj["Registration_No"] as? String ?? "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit: obj["IN_OUT"] as? String ?? "", Order_dateinit :"", Order_Totalinit :"", Order_Paidinit :"")
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            if let value = param["Order_Payment_List"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "Order_List_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    
                    
                    let TotalBalence : Float32 = obj.object(forKey: "TotalBalence")as? Float32 ?? 0.0
                    let stringTotalBalence = "\(TotalBalence)"
                    let TotalAmount : Float32 = obj.object(forKey: "TotalAmount")as? Float32 ?? 0.0
                    let stringTotalAmount = "\(TotalAmount)"
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: obj["Approval_Status"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_Intend_No"] as? String ?? "", Order_CreatedDateinit: obj["CreatedDate"] as? String ?? "", Order_Cust_Codeinit: obj["Cust_Code"] as? String ?? "", Order_Enquiry_Typeinit: obj["Enquiry_Type"] as? String ?? "", Order_Unit_Modelinit: stringTotalAmount, Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit:stringTotalBalence, Order_dateinit :"", Order_Totalinit :"", Order_Paidinit :"")
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
                
            if let value = param["OrderCompleteSubOrder"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "OR_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    let TotalBalence : Float32 = obj.object(forKey: "Delivery_Installation_Id")as? Float32 ?? 0.0
                    let stringTotalBalence = "\(TotalBalence)"
   
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Work_Order_Number"] as? String ?? "", Order_AssignedTo_Nameinit: obj["Ac_Driver_System"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_No"] as? String ?? "", Order_CreatedDateinit: obj["Handover_Date"] as? String ?? "", Order_Cust_Codeinit: obj["Remarks"] as? String ?? "", Order_Enquiry_Typeinit: obj["Work_Order_Number"] as? String ?? "", Order_Unit_Modelinit: "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit:"", Order_dateinit :"", Order_Totalinit :"", Order_Paidinit :stringTotalBalence)
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
                
            if let value = param["GetAll_DispatchRequestList"] {
                
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    let menu_Id : Int = obj.object(forKey: "OR_Id")as? Int ?? 0
                    let stringMenu_Id = "\(menu_Id)"
                    let TotalBalence : Int = obj.object(forKey: "Parent_Order_Id")as? Int ?? 0
                    let stringTotalBalence = "\(TotalBalence)"
                    let Total : Int = obj.object(forKey: "Parent_Order_Id")as? Int ?? 0
                    let stringTotal = "\(Total)"
                    
                    let menumodel = orderModelList(Order_Customer_Nameinit: obj["Customer_Name"] as? String ?? "", Order_AssignedTo_Nameinit: obj["Ac_Driver_System"] as? String ?? "", Order_Order_Intend_Noinit: obj["Order_No"] as? String ?? "", Order_CreatedDateinit: obj["Updated_Date"] as? String ?? "", Order_Cust_Codeinit: obj["Remarks"] as? String ?? "", Order_Enquiry_Typeinit: obj["Work_Order_Number"] as? String ?? "", Order_Unit_Modelinit: "", Order_List_Idinit: stringMenu_Id, Order_Approval_Statusinit:obj["Request_Status"] as? String ?? "", Order_dateinit :"", Order_Totalinit :stringTotal, Order_Paidinit :stringTotalBalence)
                    
                    
                    
                    
                    menuListdisplay.append(menumodel)
                    
                    
                    
                    
                }
            }
            
                listTableView.reloadData()
                
           
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
            let model : orderModelList = menuListdisplay[indexPath.row]
          let value1 =  model.Order_Customer_Name.height(withConstrainedWidth: self.view.frame.size.width - 90, font: UIFont.systemFont(ofSize: 14, weight:.regular))
            
            
            if value1<20{
            
                return 100
            }else{
                 return 115
                
            }
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            

            
                var cell = OrderlistTableViewCell()
                
                cell = listTableView.dequeueReusableCell(withIdentifier: "OrderlistCell", for: indexPath ) as! OrderlistTableViewCell
                
                
                configureMarketdisplayCell(cell: cell,forrowatindepath:indexPath as NSIndexPath)
                
                return cell
          
        }
        
        
    
        
        
        
        
        
        
        
        
        
        
        
        func configureMarketdisplayCell(cell:OrderlistTableViewCell,forrowatindepath indexPath:NSIndexPath){
            
           
            let model : orderModelList = menuListdisplay[indexPath.row]
            
            cell.customerName.text = model.Order_Customer_Name
            cell.serviceName.text = model.Order_Order_Intend_No
            cell.arrovd.text = ""
            cell.radioButton.isHidden = false
            cell.active.textColor = .black
            cell.radioButtonWidth.constant = 30
            if model.Order_Approval_Status == "Approved" {
                cell.aprrovdview.backgroundColor = .green
                
                
            }else{
                cell.aprrovdview.backgroundColor = .red
                
            }
            
            if model.Order_Enquiry_Type == "Bus" {
                cell.busImage.image = #imageLiteral(resourceName: "ic_bus")
            }else{
                  cell.busImage.image = #imageLiteral(resourceName: "ic_truck")
                
            }
            
            if headingList.text == "Order Transfer List" {
            
            
          cell.active.text = model.Order_Unit_Model
                
                
                
            }
                
            if headingList.text == "Order complete" {
                
                
                cell.active.text = model.Order_Unit_Model
                
                
                
            }
                else if headingList.text == "Payment Due Report" {
                 cell.active.text = model.Order_Unit_Model
                cell.radioButton.isHidden = true
                cell.radioButtonWidth.constant = 0
            }
            else if headingList.text == "Order Complete SubOrder" {
                
                cell.arrovd.text = model.Order_CreatedDate
                 cell.active.text = ""
                cell.radioButton.isHidden = true 
                cell.radioButtonWidth.constant = 0
              
            }
                
                
            else if headingList.text == "Dispatch Request List" {
                
                cell.arrovd.text = model.Order_CreatedDate
                cell.active.text = model.Order_Approval_Status
                cell.radioButton.isHidden = true
                cell.radioButtonWidth.constant = 0
                  cell.dispatchViewWidth.constant = 0
                 cell.aprrovdview.backgroundColor = .white
                  cell.dispatchView.isHidden = true
               
              
                
                
                
            }
             else if headingList.text == "Order payment Status" {
                
                cell.active.text = model.Order_Approval_Status
                cell.radioButton.isHidden = true
                cell.radioButtonWidth.constant = 0
                if model.Order_Approval_Status == "Approved" {
                  
                    cell.active.textColor = .green
                    
                }else{
                
                    cell.active.textColor = .red
                }
            }
            else if headingList.text == "Order Pending List" {
                
                cell.active.text = model.Order_Approval_Status
                cell.arrovd.text = model.Order_Unit_Model
                cell.radioButton.isHidden = true
                cell.radioButtonWidth.constant = 0
                if model.Order_Approval_Status == "Approved" {
                    
                    cell.active.textColor = .green
                    
                }else{
                    
                    cell.active.textColor = .red
                }
            }
            else if headingList.text == "Vehicle Warranty" {
                
                cell.active.text = model.Order_Approval_Status
                cell.arrovd.text = model.Order_Unit_Model
               
                if model.Order_Approval_Status == "IN" {
                    
                    cell.active.textColor = .green
                    
                }else{
                    
                    cell.active.textColor = .red
                }
            }
            else if headingList.text == "Order List" {
                
                cell.active.text = model.Order_AssignedTo_Name
                cell.arrovd.text = model.Order_Approval_Status
             
            }
 else if headingList.text == "Order List Details Report" {
                cell.active.text = model.Order_Approval_Status
                cell.arrovd.text = model.Order_Unit_Model
                
                cell.radioButton.isHidden = true
                cell.radioButtonWidth.constant = 0
            }
                
            else if headingList.text == "Order List Report" {
                cell.radioButton.isHidden = true
                cell.radioButtonWidth.constant = 0
                cell.active.text = model.Order_AssignedTo_Name
                cell.arrovd.text = model.Order_Unit_Model
                
                if model.Order_AssignedTo_Name == "Approved" {
                    
                    cell.active.textColor = .green
                      cell.aprrovdview.backgroundColor = .green
                    
                    
                    
                }else if model.Order_AssignedTo_Name == "Waiting" {
                    
                    cell.active.textColor = .orange
                      cell.aprrovdview.backgroundColor = .orange
                    
                    
                    
                }else
                
                
                {
                    
                    cell.active.textColor = .red
                      cell.aprrovdview.backgroundColor = .red
                    
                    
                }
                
                
                
            }
            else if headingList.text == "AMC" {
                
                cell.active.text = ""
                cell.arrovd.text = ""
                cell.aprrovdview.backgroundColor = .blue
                cell.busImage.image = #imageLiteral(resourceName: "ic_bus")
                cell.customerName.text = model.Order_Unit_Model
                cell.serviceName.text = model.Order_CreatedDate
            } else if headingList.text == "Payment Collection List" {
             
                
                
                cell.radioButton.isHidden = true
                cell.radioButtonWidth.constant = 0
                cell.arrovd.text = "Total Amount: " + model.Order_Unit_Model
                cell.active.text = "Balance Amount: " + model.Order_Approval_Status
                cell.aprrovdview.backgroundColor = .blue
                cell.busImage.image = #imageLiteral(resourceName: "ic_bus")
             
            }
            else if headingList.text == "Installation List For Approval"
            {
                
                cell.active.text =  model.Order_CreatedDate
                
                cell.aprrovdview.backgroundColor = .blue
            }
                
            else if headingList.text == "Installation List For Status"
            {
                cell.active.text =  model.Order_CreatedDate
                
                cell.aprrovdview.backgroundColor = .blue
            }
                
                
                
            else if headingList.text == "Payment Collection Report" {
                
                
                
                cell.radioButton.isHidden = true
                cell.radioButtonWidth.constant = 0
                cell.arrovd.text = "Payment Mode: " + model.Order_Cust_Code
                cell.active.text =  model.Order_CreatedDate
           
                cell.aprrovdview.backgroundColor = .blue
                
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
            
            
            
//
//            if passFunctionality == "ServiceEnquiryList" {
//
//                let actionSheetController: UIAlertController = UIAlertController(title: "", message: "", preferredStyle:.actionSheet)
//
//                let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
//
//
//
//
//                    sender.setImage(selectedImage, for: .normal)
//                }
//                actionSheetController.addAction(cancelActionButton)
//
//
//                let saveActionButton = UIAlertAction(title: "Confirm and Assign Technician", style: .default)
//                { _ in
//                    sender.setImage(selectedImage, for: .normal)
//
//
//                    let popOverVC = UIStoryboard(name: "Technician", bundle: nil).instantiateViewController(withIdentifier: "assignTechnicianVCID") as! AssignTechnicianVC
//
//
//                    popOverVC.seguetoModel = self.seguetoModel
//                    popOverVC.delegate = self
//                    self.addChildViewController(popOverVC)
//
//                    popOverVC.view.frame = self.view.frame
//                    self.view.addSubview(popOverVC.view)
//                    popOverVC.didMove(toParentViewController: self)
//
//                }
//                actionSheetController.addAction(saveActionButton)
//
//                let editActionButton = UIAlertAction(title: "Edit Service Enquiry", style: .default)
//                { _ in
//
//                    sender.setImage(selectedImage, for: .normal)
//
//                    let storyboard: UIStoryboard = UIStoryboard(name: "ServiceRegistration", bundle: nil)
//                    let vc = storyboard.instantiateViewController(withIdentifier: "serviceRegistrationID") as! ServiceRegistrationVC
//
//
//
//
//
//                    vc.seguefromModel = self.seguetoModel
//
//                    self.navigationController?.pushViewController(vc, animated: true)
//                }
//                actionSheetController.addAction(editActionButton)
//                let deleteActionButton = UIAlertAction(title: "Delete Service Enquiry", style: .default)
//                { _ in
//
//                    sender.setImage(selectedImage, for: .normal)
//                    self.serviceCallDelete()
//                }
//
//
//                actionSheetController.addAction(deleteActionButton)
//                self.present(actionSheetController, animated: true, completion: nil)
//            }
            
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
            
            
            
            
            
            
            let checkSting :String = seguefromModel.menu_Name!
            
            if (checkSting == "AMC" || checkSting == "Vehicle Warranty")  {
                
             
                
                
                
            }else{
            seguetoModel = menuListdisplay[indexPath.row]
                performSegue(withIdentifier: "orderDetails", sender: self)}
            
      
           // orderDetails
            
            
//            if passFunctionality == "JobCardHistory" {
//
//
//
//
//
//
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
//
//            }else{
//
//                performSegue(withIdentifier: "detailsSegue", sender: self)
//
//            }
            
            
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if (segue.identifier == "orderDetails") {
                
                
                let secondViewController = segue.destination as! VechicleListdetailVC
                
                secondViewController.segueOrderModel = seguetoModel
                secondViewController.passFunctionalityHead = "order"
                
                secondViewController.passFunctionality = seguefromModel.menu_Name
                
            }
            
            
        }
        
        
        
        
        
    }
    extension OrderListVC{
        func DispatchServiceCallRepresenation() -> [String : Any] {
            
            let parameters:[String : Any] = ["BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id")]
            return parameters as [String : Any]
            
        }
        
        func OrderListServiceCallRepresenation() -> [String : Any] {
            
            let parameters:[String : Any] = ["PageSize":"20","BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"CurrentPage":currentPage,"SearchKeyWord":searchListBar.text ?? ""]
            return parameters as [String : Any]
            
        }
        func OrderListCompleteServiceCallRepresenation() -> [String : Any] {
            
            let parameters:[String : Any] = ["PageSize":"20","BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"CurrentPage":currentPage,"SearchKeyWord":searchListBar.text ?? "","SortingStatus":  "Normal"]
            return parameters as [String : Any]
            
        }
        func InstallationListSortingServiceCallRepresenation() -> [String : Any] {
            
            let parameters:[String : Any] = ["PageSize":"20","BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"CurrentPage":currentPage,"SearchKeyWord":searchListBar.text ?? "","SortingStatus": "ACTIVE"]
            return parameters as [String : Any]
            
        }
        
        
        func OrderListSortingServiceCallRepresenation() -> [String : Any] {
            
            let parameters:[String : Any] = ["PageSize":"20","BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"CurrentPage":currentPage,"SearchKeyWord":searchListBar.text ?? "","SortingStatus": "All","FromDate":"","ToDate":""]
            return parameters as [String : Any]
            
        }
        
        func OrderListPaymentDueReportServiceCallRepresenation() -> [String : Any] {
  
            let parameters:[String : Any] = ["PageSize":"20","BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"CurrentPage":currentPage,"TypeofEnquirySearchText": "","MarketingPersonSearchText": "","FromDate":"","ToDate":"","CusomerNameSearchText":"","UnitNameSearchText":"","BranchNameSearchText": "","ModeofPaymentSearchText": ""]
            return parameters as [String : Any]
            
        }
        func OrderListReportServiceCallRepresenation() -> [String : Any] {
            
            let parameters:[String : Any] = ["PageSize":"20","BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"CurrentPage":currentPage,"TypeofEnquirySearchText": "","MarketingPersonSearchText": "","FromDate":"","ToDate":"","CusomerNameSearchText":"","UnitNameSearchText":"","BranchNameSearchText": "","SortingStatus": ""]
            return parameters as [String : Any]
            
        }
       
        
        
//
//        func OrderCallRepresenation() -> [String : Any] {
//
//            let parameters:[String : Any] = ["Service_Id":self.seguetoModel.Service_Id!]
//            return parameters as [String : Any]
//
//        }
//        func OrderCompleteCallRepresenation() -> [String : Any] {
//
//            let parameters:[String : Any] = ["Service_Id":self.seguetoModel.Service_Id!,"User_Id":userDefaults.GET_USERDEFAULTS(objectValue:"UserId")]
//            return parameters as [String : Any]
//
//        }
        
        
        
        
}
