//
//  HomeVC.swift
//  TransACNR
//
//  Created by Monish M S on 26/04/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit
import SDWebImage



class HomeVC: UIViewController ,GetResultResponse,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
@IBOutlet var menuListCV: UICollectionView!
     let functionCall = GetRespone()
     var menuListdisplay   =  [MenuDisplayModel]()
    var segueModel:MenuDisplayModel  = MenuDisplayModel()
    
    var sidebar: FrostedSidebar!
    override func viewDidLoad() {
        super.viewDidLoad()
           menuListdisplay.removeAll()
         serviceCall()
        self.navigationController?.navigationBar.isHidden = true;
       
  
        // Do any additional setup after loading the view.
    }
    @IBAction func onBurger() {
        
        var menuListmenu   =  [String]()
        var menuListColor   =  [UIColor]()
        var menuListActionDict   =  [NSDictionary]()
        
       
        for i in 0..<menuListdisplay.count {
            
            
            let menuItem = menuListdisplay[i]
            menuListmenu.append(TransACNRLiveImgUrl + menuItem.menuLeftPannelImage! + ".png")
            menuListColor.append(UIColor(red: 126/255, green: 242/255, blue: 195/255, alpha: 1))
            let populatedDictionary = [i:{self.sidebar.dismissAnimated(true, completion: { finished in print(i)}) } ]
            menuListActionDict.append(populatedDictionary as NSDictionary)
            
        }
        
        
        
      
        
        
        
        
        
        sidebar = FrostedSidebar(itemImages: menuListmenu,
                                 colors: menuListColor,
                                 selectionStyle: .single)
        
        
        
        
        sidebar.actionForIndex = [
            0: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 0) }) },
            1: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 1)}) },
            2: {self.sidebar.dismissAnimated(true, completion: { finished in
                
                self.movingSegueWithIndex(menuIndex: 2)}) },
            3: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 3)}) },
            4: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 4)}) },
            5: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 5)}) },
            6: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 6)}) },
            7: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 7)}) },
        
            8: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 8) }) },
            9: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 9)}) },
            10: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 10)}) },
            11: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 11)}) },
            12: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 12)}) },
            13: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 13)}) },
            14: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 14)}) },
            15: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 15)}) },
        
            16: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 16) }) },
            17: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 17)}) },
            18: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 18)}) },
            19: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 19)}) },
            20: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 20)}) },
            21: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 21)}) },
            22: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 22)}) },
            23: {self.sidebar.dismissAnimated(true, completion: { finished in
                self.movingSegueWithIndex(menuIndex: 23)}) }
        
        
        ]
        
        
        
        
        
        
        
        
        
        self.sidebar.showInViewController(self, animated: true)
       
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func serviceCall()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: HomeServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRMenus as NSString)
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
        menuListCV.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return menuListdisplay.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
    return  CGSize(width: (collectionView.frame.size.width/3)-3, height: (collectionView.frame.size.width/3)-3)
  
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell  = menuListCV.dequeueReusableCell(withReuseIdentifier: "MenuCellID", for: indexPath ) as! MenuCollectionViewCell
        
        
        configureMarketdisplayCell(cell: cell,forrowatindepath:indexPath as NSIndexPath)
        return cell
        
    }
    
    
    func configureMarketdisplayCell(cell:MenuCollectionViewCell,forrowatindepath indexPath:NSIndexPath){
        
        
        let modelData : MenuDisplayModel = menuListdisplay[indexPath.row]
        
        cell.MenuImage.sd_setImage(with: URL(string: TransACNRLiveImgUrl+modelData.menu_Image), placeholderImage:UIImage(named: "imagePlaceHolder"))
        cell.MenuHead.text = modelData.menu_Name
    }



func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    
    
    movingSegueWithIndex(menuIndex: indexPath.row)
    
}



func movingSegueWithIndex(menuIndex: Int){
    
    segueModel = menuListdisplay[menuIndex]
    performSegue(withIdentifier: "homeSubListSegue", sender: self)
    
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "homeSubListSegue") {
        let secondViewController = segue.destination as! HomeSubListVC
        
        secondViewController.seguefromModel = segueModel
    }
}
}


extension HomeVC{
    
    
    func HomeServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Menu_Id":"0","BranchId":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id"),"Role_Id":userDefaults.GET_USERDEFAULTS(objectValue:"RoleId"),"User_Id":userDefaults.GET_USERDEFAULTS(objectValue:"UserId")]
        return parameters as [String : Any]
        
    }
}
