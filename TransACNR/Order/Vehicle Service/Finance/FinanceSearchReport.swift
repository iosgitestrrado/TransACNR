//
//  FinanceSearchReport.swift
//  Filter
//
//  Created by Arunbabu.j on 29/05/18.
//  Copyright © 2018 Arunbabu.j. All rights reserved.
//

import UIKit

class FinanceSearchReport: UIViewController,GetResultResponse,UITableViewDataSource, UITableViewDelegate,filterAddDelegate {
    
    @IBOutlet weak var listTableView: UITableView!
  
 
    
  
    var totalCount :Int = 0
    var currentPage :Int = 1
 
    
    let functionCall = GetRespone()
    var menuListdisplay   =  [DetailModel]()
    var seguetoModel :DetailModel = DetailModel()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    menuListdisplay.removeAll()
    
    
   serviceCall()
    
    listTableView.tableFooterView = UIView(frame: .zero)
  
    }
    
   
    func filterreloaded(){
        
        serviceCall()
    }
    
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToNavigation(_ sender: Any) {
    
    _ = navigationController?.popViewController(animated: true)
    
    }
    
    @IBAction func buttonPop(_ sender: UIButton)
    {
    /*
     let storyboard = UIStoryboard(name: "Main", bundle: nil)
     
     let vc = storyboard.instantiateViewController(withIdentifier: "popup") as! ViewController
     
     vc.modalPresentationStyle = .overFullScreen
     vc.modalTransitionStyle = .crossDissolve
     self.present(vc, animated: true, completion: nil)
     */
    
    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popup") as!  FilterViewController
        
        popOverVC.delegateAdd = self
    self.addChildViewController(popOverVC)
        
        
        
    popOverVC.view.frame = self.view.frame
    self.view.addSubview(popOverVC.view)
    popOverVC.didMove(toParentViewController: self)
    
    }
  
    
    
    
    
    func serviceCall()  {
    
    functionCall.delegete = self
   
    functionCall.getserviceCall(param: VechileListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRGetFinanceSearchReport as NSString)
   
    
    
    
    
    
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
    
    
    

    
    
    
    if let value = param["FinanceSearchReport"] {
    
    for item in value as! Array<Any> {
    
    let obj = item as! NSDictionary
    
    //                let menumodel = VechileListModel(Service_Customer_Nameinit: obj["Name"] as? String ?? "", Service_AssignedTo_Nameinit: obj["Job_Card_No"] as? String ?? "", Service_CustomStatusinit: obj["CustomStatus"] as? String ?? "", Service_EnquiryNoinit: obj["Vehicle_No"] as? String ?? "")
    let menu_Id : Int = obj.object(forKey: "Service_Id")as? Int ?? 0
    let stringMenu_Id = "\(menu_Id)"
    
    
    
    
    
    let menumodel = DetailModel(detailService_Idinit:stringMenu_Id,detailJobcardNumberinit: obj["JobCardNo"] as? String ?? "", detailServiceEnquiryinit: obj["ServiceEnquiryNo"] as? String ?? "", detailCustomerNameinit: obj["Customer_Name"] as? String ?? "", detailTypeofServiceinit: obj["JobCardDate"] as? String ?? "", detailAssignedToinit: obj["BalanceAmount"] as? String ?? "", detailCustomerStatusinit: obj["RecievedAmount"] as? String ?? "", detailActiveStatusinit: obj["Vehicle_Number"] as? String ?? "", detailComplaintTypeinit: obj["TotalAmount"] as? String ?? "", detailCustomerCodeinit: obj["Customer_Code"] as? String ?? "", detailCustomerAddressinit: obj["Customer_Address"] as? String ?? "", detailMobileNumberinit: obj["Mobile_No"] as? String ?? "", detailUnitModelinit: obj["V_Model"] as? String ?? "", detailSerialNumberinit: obj["V_Serial_No"] as? String ?? "", detailEngineHourinit: obj["Engine_Hour"] as? String ?? "", detailPlaceAttendedinit: obj["Place_Attended"] as? String ?? "", detailEntryTimeinit: obj["Entry_Time"] as? String ?? "", detailDetailsofJobinit: obj["Details_of_Job"] as? String ?? "", detailContactPersoninit: obj["ContactPerson"] as? String ?? "", detailRemarksinit: obj["Remarks"] as? String ?? "")
    
    
    
    
    
    
    
    
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
    let model : DetailModel = menuListdisplay[indexPath.row]
    let value1 =  model.detailCustomerName.height(withConstrainedWidth: self.view.frame.size.width - 35, font: UIFont.systemFont(ofSize: 15, weight:.regular))
    
    
    
    return 50.0 + value1;
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
  
    
    
    var cell = JobListTVCell()
    
    cell = listTableView.dequeueReusableCell(withIdentifier: "jobListCell", for: indexPath ) as! JobListTVCell
    
    
    configurejobdisplayCell(cell: cell,forrowatindepath:indexPath as NSIndexPath)
    
    return cell
    
    
    }
    
    
    
    func configurejobdisplayCell(cell:JobListTVCell,forrowatindepath indexPath:NSIndexPath){
    
    let model : DetailModel = menuListdisplay[indexPath.row]
    
    cell.customerName.text = model.detailCustomerName
    cell.vechilenumber.text = model.detailActiveStatus
    
    cell.serviceNumber.text = model.detailJobcardNumber
    
    cell.serviceStatus.text = model.detailTypeofService
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
  
  
  
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    seguetoModel = menuListdisplay[indexPath.row]
    
        let storyboard: UIStoryboard = UIStoryboard(name: "FinanceFormReport", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FinanceFormReportID") as! FinaceReportVC
        
        
        
        
        
        vc.seguefromModel = self.seguetoModel
        
        self.navigationController?.pushViewController(vc, animated: true)
    
    
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let secondViewController = segue.destination as! VechicleListdetailVC
    
    secondViewController.seguefromModel = seguetoModel
    
 
    
    
    
    
    }
    
    
    
    
    
    }
    extension FinanceSearchReport{
        
        
        func VechileListServiceCallRepresenation() -> [String : Any] {
            
            
            
            
            
            
            let parameters:[String : Any] = ["PageSize":"20","BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"CurrentPage":currentPage,"SearchKeyWord": "" , "FromDate":newSharedInstance.filterFromDate,
                                             "ToDate":newSharedInstance.filterToDate,
                                             "CusomerNameSearchText":newSharedInstance.filterCustomerName,
                                             "JobCardNumSearchText":newSharedInstance.filterJobCardNumber,
                                             "VehicleNumSearchText":newSharedInstance.filterVehiclenumber,
                                             "SerialNumSearchText":newSharedInstance.filterUnitSerial]

            return parameters as [String : Any]
            
        }
        
       
        
        
        
        
}
