//
//  HomeSubtoSubVC.swift
//  TransACNR
//
//  Created by Monish M S on 12/07/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class HomeSubtoSubVC: UIViewController,GetResultResponse,UITableViewDataSource, UITableViewDelegate  {
    var seguefromModel :MenuDisplayModel = MenuDisplayModel()
    let functionCall = GetRespone()
    var menuListdisplay   =  [MenuDisplayModel]()
    @IBOutlet weak var subListTableView: UITableView!
    @IBOutlet weak var  SubListHead: UILabel!
   var tableIndex :Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SubListHead.text = seguefromModel.menu_Name
     serviceCall()
        // Do any additional setup after loading the view.
    }
    func serviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: HomeSubListServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRMenus as NSString)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
       
            tableIndex = indexPath.row
            performSegue(withIdentifier: "demoVCSegue", sender: self)
            
            
            
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "demoVCSegue") {
            let model : MenuDisplayModel = menuListdisplay[tableIndex]
            let secondViewController = segue.destination as! DemoVC
            secondViewController.seguefromModel = model
        }
            
            
        
    }

}
extension HomeSubtoSubVC{
    
    
    func HomeSubListServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Menu_Id":seguefromModel.menu_Id!,"BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"Role_Id":userDefaults.GET_USERDEFAULTS(objectValue:"RoleId"),"User_Id":userDefaults.GET_USERDEFAULTS(objectValue:"UserId")]
        return parameters as [String : Any]
        
    }
}
