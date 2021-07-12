//
//  VehicleOwnershipVC.swift
//  TransACNR
//
//  Created by Monish M S on 30/05/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit
import DropDown


class VehicleOwnershipVC:  UIViewController,GetResultResponse,UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate,changeOwnershipAddDelegate{
    func changeOwnershipreloaded() {
         serviceCallTable()
    }
     @IBOutlet weak var hiddenview: UIView!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var searchListBar: UISearchBar!
      let vehicleNumberDrop = DropDown()
   
    var displayNameArray : [String] = []
    var displayNamedictArray : [NSDictionary] = []
    
    var displayVehicleictArray : [NSDictionary] = []

    let functionCall = GetRespone()
    var Vechicle_Id : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayVehicleictArray.removeAll()
   
        vehicleNumberDrop.bottomOffset = CGPoint(x: 5, y:(searchListBar?.frame.height)!)
        vehicleNumberDrop.anchorView = searchListBar
        vehicleNumberDrop.direction = .bottom
        vehicleNumberDrop.width = searchListBar?.frame.width
        hiddenview.isHidden = false
        searchListBar.showsCancelButton = true
        
        vehicleNumberDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.serviceTypeNameOn(index: index, item: item)
        }
        
        
        
        listTableView.tableFooterView = UIView(frame: .zero)
        searchListBar.delegate = self
        
    }
    
    func serviceTypeNameOn(index: Int, item: String){
        
        
        
        searchListBar?.text = item
        
        for itemValue in displayNamedictArray {
            let obj = itemValue as NSDictionary
            let name = obj.object(forKey: "Registration_No") as! String
            
            
            if name == item {
                
                
                let Customer_Id : Int = obj.object(forKey: "Vehicle_Reg_Id")as? Int ?? 0
                Vechicle_Id = "\(Customer_Id)"
                
                serviceCallTable()
                
                
                
                
            }
        }
        
        
        
        
        
    }
    
    func serviceCallTable()  {
        
        functionCall.delegete = self
        
        
        functionCall.getserviceCall(param: ServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRGetVehicleOwnerShipSearching as NSString)
        
        
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToNavigation(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    
   
    
    
    
    
    
    func serviceCall()  {
        
        functionCall.delegete = self
        
  
            functionCall.getserviceCall(param: VechileListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRNumberForVehicleOwnerShip as NSString)
      
        
        
        
        
        
    }
    func GetServiceRespone(param: NSDictionary) {
        
       
        
        if let value = param["VehicleAutoComplete"] {
            
            displayNamedictArray.removeAll()
            displayNameArray.removeAll()
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                displayNamedictArray.append(obj)
                displayNameArray.append(obj.object(forKey: "Registration_No") as! String)
                
            }
            if  displayNameArray.count > 0 {
                
                
                vehicleNumberDrop.dataSource = displayNameArray
                vehicleNumberDrop.show()
                
            }
            
            
        }
        
        if let value = param["VehicleOwnerShipSearching"] {
            
            displayVehicleictArray.removeAll()
            
            
           
            for item in value as! Array<Any> {
                
                let obj = item as! NSDictionary
                
                displayVehicleictArray.append(obj)
               
                
            }
            if  displayVehicleictArray.count > 0 {
                
                hiddenview.isHidden = true
                
                 listTableView.reloadData()
                
            }
            
            
        }
        
            
            
            
            
        
            
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return displayVehicleictArray.count
        
        
    }
  
    
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let model : NSDictionary = displayVehicleictArray[indexPath.row]
        let modelString : String = model.object(forKey: "Customer_Name") as! String
        
        let value1 =  modelString.height(withConstrainedWidth: self.view.frame.size.width - 130, font: UIFont.systemFont(ofSize: 15, weight:.regular))
        
        
        
        return 50.0 + value1;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            
            var cell = VechileListTVCell()
            
            cell = listTableView.dequeueReusableCell(withIdentifier: "vechicleListCell", for: indexPath ) as! VechileListTVCell
            
            
            configureMarketdisplayCell(cell: cell,forrowatindepath:indexPath as NSIndexPath)
            
            return cell
            
            
       
    }
    
    
    
  
    
    
    
    
    
    
    
    
    
    
    
    func configureMarketdisplayCell(cell:VechileListTVCell,forrowatindepath indexPath:NSIndexPath){
        
        let model : NSDictionary = displayVehicleictArray[indexPath.row]
        
        
        cell.radioButton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
        cell.radioButton.tag = indexPath.row
        cell.radioButton.isEnabled = true
       
        let selectedImage = UIImage(named: "ic_checkbox_empty")
        let selectedImagehideen = UIImage(named: "CheckboxEmpty")
        
        
        
           let vehicleNumber = model.object(forKey: "Registration_No") as? String
        cell.serviceName.text = vehicleNumber?.uppercased()
   let Customer_Name = model.object(forKey: "Customer_Name") as? String
        
        
        
        cell.customerName.text = Customer_Name?.uppercased()
            
 let modelString : Bool = model.object(forKey: "Status") as! Bool
            
            
            
            
            
            if modelString {
             cell.radioButton.setImage(selectedImage, for: .normal)
                cell.colorImage.image = #imageLiteral(resourceName: "greentick")

                cell.radioButton.isEnabled = true

            }else {

                cell.colorImage.image = #imageLiteral(resourceName: "redtick")
              cell.radioButton.setImage(selectedImagehideen, for: .normal)
                cell.radioButton.isEnabled = false
            }
        
        
        
        
    }
    
    @objc func connected(sender: UIButton){
        let buttonTag = sender.tag
       let model : NSDictionary = displayVehicleictArray[buttonTag]
        
        let menu_Id : Int = model.object(forKey: "Vehicle_Id")as? Int ?? 0
        let stringMenu_Id = "\(menu_Id)"
        
        
        
        
        
        
        
        
        
        let deselectedImage = UIImage(named: "ic_checkbox_selected")
        sender.setImage(deselectedImage, for: .normal)
        let popOverVC = UIStoryboard(name: "VehicleOwnerShip", bundle: nil).instantiateViewController(withIdentifier: "ChangeOwnershipVC") as! ChangeOwnershipVC
        popOverVC.VehicleID = stringMenu_Id
            popOverVC.delegateAdd = self
            
            
            self.addChildViewController(popOverVC)
        
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
        
        
        
        
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchListBar.resignFirstResponder()
        displayVehicleictArray.removeAll()
        
         hiddenview.isHidden = false
       listTableView.reloadData()
            
            
            
            
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchListBar.resignFirstResponder()
        
    
        serviceCall()
        
    }
    
    
    
    
    
}
extension VehicleOwnershipVC{
    
    
    func VechileListServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Branch_Id":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"Vehicle_No":searchListBar.text ?? ""]
        return parameters as [String : Any]
        
    }
    
    func ServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Id":Vechicle_Id]
        return parameters as [String : Any]
        
    }
  
    
    
    
    
}

