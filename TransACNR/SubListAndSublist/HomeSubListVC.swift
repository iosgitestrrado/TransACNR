//
//  HomeSubListVC.swift
//  TransACNR
//
//  Created by Monish M S on 27/04/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class HomeSubListVC: UIViewController ,GetResultResponse,UITableViewDataSource, UITableViewDelegate {
var seguefromModel :MenuDisplayModel = MenuDisplayModel()
let functionCall = GetRespone()
var menuListdisplay   =  [MenuDisplayModel]()
     @IBOutlet weak var subListTableView: UITableView!
     @IBOutlet weak var  SubListHead: UILabel!
      var tableIndex :Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        serviceCall()
       SubListHead.text = seguefromModel.menu_Name
        subListTableView.tableFooterView = UIView(frame: .zero)
        
        
        
    }

    func serviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: HomeSubListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRMenus as NSString)
    }
    
    func GetServiceRespone(param: NSDictionary) {
        
        if let value = param["Menu"] {
            
            menuListdisplay.removeAll()
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                let menu_Id : Int = obj.object(forKey: "menu_Id")as? Int ?? 1
                let stringMenu_Id = "\(menu_Id)"
                
                let stringLeftImage:String = obj["LeftPannelMenuForAndroit"] as? String ?? ""
                
                
                
                
                
                let menumodel = MenuDisplayModel(menuNameinit: obj["menu_Name"] as? String ?? "", menuIDinit: stringMenu_Id, menuImageinit: obj["menu_AndroidImage"] as? String ?? "", menuLeftPannelImageinit: stringLeftImage)
                
                
                menuListdisplay.append(menumodel)
                
                
                
                
            }
        }
        
        
        
     
        subListTableView.reloadData()
    }
    @IBAction func backNavigationAction(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
        
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return menuListdisplay.count
        
        
    }
    
    
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
       
        
        return 50.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = MenuSubListTableViewCell()
       
            cell = subListTableView.dequeueReusableCell(withIdentifier: "menuSubListCell", for: indexPath ) as! MenuSubListTableViewCell
            
       
        configureMarketdisplayCell(cell: cell,forrowatindepath:indexPath as NSIndexPath)
        
        return cell
    }
    
    func configureMarketdisplayCell(cell:MenuSubListTableViewCell,forrowatindepath indexPath:NSIndexPath){
        
        let model : MenuDisplayModel = menuListdisplay[indexPath.row]
        
       
        
        
        cell.menuSubHead.text = model.menu_Name
       cell.menuSubImage.sd_setImage(with: URL(string: TransACNRLiveImgUrl+model.menu_Image), placeholderImage:UIImage(named: "imagePlaceHolder"))
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if  seguefromModel.menu_Name == "Vehicle Service" {
        
        
        if indexPath.row == 0 {
            let storyboard: UIStoryboard = UIStoryboard(name: "ServiceRegistration", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "serviceRegistrationID") as! ServiceRegistrationVC
            
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
       else if indexPath.row == 6 {
          performSegue(withIdentifier: "finacesearchID", sender: self)
        }
        else if indexPath.row == 7 {
          performSegue(withIdentifier: "ownerShipSegue", sender: self)
        }
        




        else  {
            
            tableIndex = indexPath.row
            performSegue(withIdentifier: "serviceListSegue", sender: self)
            
            
        }
        
        }else if  seguefromModel.menu_Name == "Inventory" {
            
            
            if indexPath.row == 1 || indexPath.row == 4{
                tableIndex = indexPath.row
                performSegue(withIdentifier: "subListsubSegue", sender: self)
                
                
                
            }
             
                
                
                
            else  {
                
                tableIndex = indexPath.row
                performSegue(withIdentifier: "demoVCSegue", sender: self)
                
                
            }
            
        }
        else if  seguefromModel.menu_Name == "Finance" {
            
            
            if indexPath.row == 6 {
                tableIndex = indexPath.row
                performSegue(withIdentifier: "subListsubSegue", sender: self)
                
                
                
            }
                
                
                
                
            else  {
                
                tableIndex = indexPath.row
                performSegue(withIdentifier: "demoVCSegue", sender: self)
                
                
            }
            
        }
        else if  seguefromModel.menu_Name == "Order" {
            
            
            
                tableIndex = indexPath.row
                performSegue(withIdentifier: "orderSegue", sender: self)
                
                
                
           
            
        }
      else  if   seguefromModel.menu_Name == "Marketing"
        {
            if indexPath.row == 0 {
            let storyboard: UIStoryboard = UIStoryboard(name: "Enquiry", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "enquiryRegistrationID") as! EnquiryVc
            self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }
            
            
        else{
            tableIndex = indexPath.row
            performSegue(withIdentifier: "demoVCSegue", sender: self)
            
            
            
        }
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "serviceListSegue") {
            let secondViewController = segue.destination as! VechileListVC
            
            
            if  tableIndex == 1 {
            secondViewController.passFunctionality = "ServiceEnquiryList"
                
                
            }else  if  tableIndex == 2 {
                secondViewController.passFunctionality = "ServiceList"
                
                
            }else  if  tableIndex == 3 {
                secondViewController.passFunctionality = "JobCardHistory"
                
                
            }
            else  if  tableIndex == 4 {
                secondViewController.passFunctionality = "Billable/NonBillable"
                
                
            }
            else  if  tableIndex == 5 {
                secondViewController.passFunctionality = "Finance"
                
                
            }
            
        }else if (segue.identifier == "demoVCSegue") {
             let model : MenuDisplayModel = menuListdisplay[tableIndex]
             let secondViewController = segue.destination as! DemoVC
            secondViewController.seguefromModel = model
            }
         else if  (segue.identifier  == "orderSegue") {
            let secondViewController = segue.destination as! OrderListVC
            let model : MenuDisplayModel = menuListdisplay[tableIndex]
            
                secondViewController.seguefromModel = model
                
                
         
            
        }
        else if (segue.identifier == "subListsubSegue"){
            
             let model : MenuDisplayModel = menuListdisplay[tableIndex]
            
            let secondViewController = segue.destination as! HomeSubtoSubVC
            
            secondViewController.seguefromModel = model
        }
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeSubListVC{
    
    
    func HomeSubListServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Menu_Id":seguefromModel.menu_Id!,"BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"Role_Id":userDefaults.GET_USERDEFAULTS(objectValue:"RoleId"),"User_Id":userDefaults.GET_USERDEFAULTS(objectValue:"UserId")]
        return parameters as [String : Any]
        
    }
}
