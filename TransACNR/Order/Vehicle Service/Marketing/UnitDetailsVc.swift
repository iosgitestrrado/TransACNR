//
//  customized.swift
//  scroll
//
//  Created by Arunbabu.j on 5/8/18.
//  Copyright © 2018 Arunbabu.j. All rights reserved.
//

import UIKit
import DropDown
import SkyFloatingLabelTextField

class UnitDetailsVc: UIViewController ,UITextFieldDelegate,AMChoiceDelegate,GetResultResponse
{
    
    var txt = "  "
    let functionCall = GetRespone()
    var displayLengthNamedictArray : [NSDictionary] = []
    var displayLengthNameArray : [String] = []
    
    let batteryDrop = DropDown()
    let lengthDrop = DropDown()
    let roofDrop = DropDown()
    let compressorDrop = DropDown()
    let coolingDrop = DropDown()
    let alternetorDrop = DropDown()
    
    
    @IBOutlet weak var unitView: UIView!
    
    @IBOutlet weak var sendView: UIView!
    
    @IBOutlet weak var choiceView: AMChoice!
    
    @IBOutlet weak var bracketview: UIView!
    @IBOutlet weak var crankView: UIView!
    @IBOutlet weak var powerpacks: UIView!
    
    @IBOutlet weak var inView: UIView!
    @IBOutlet weak var mainUnitView: UIView!
    
    @IBOutlet weak var subViewHeading: UILabel!
    
    
    
    
    
    let myItems = [
        VoteModel(title: "Direct Drive", isSelected: false, isUserSelectEnable: true),
        VoteModel(title: "Power Pack Models", isSelected: false, isUserSelectEnable: true)]
   
    //  main view height constant
    
    @IBOutlet weak var myheight: NSLayoutConstraint!
    @IBOutlet weak var sendViewHeight: NSLayoutConstraint!
    
    
    
  //textfields

    @IBOutlet weak var length: UITextField!
    @IBOutlet weak var roofTop: UITextField!
    @IBOutlet weak var compressorMdl: UITextField!
    @IBOutlet weak var alternatorMdl: UITextField!
    @IBOutlet weak var coolingCapacity: UITextField!
    @IBOutlet weak var numberOfUnits: UITextField!
    @IBOutlet weak var unitName: UITextField!
    @IBOutlet weak var cusBattery: UITextField!
    
   // button outlet
    
    @IBOutlet weak var lenbtn: UIButton!
    @IBOutlet weak var btnroof: UIButton!
    @IBOutlet weak var btncompressor: UIButton!
    @IBOutlet weak var btnalternetor: UIButton!
    @IBOutlet weak var btncapacity: UIButton!
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myheight.constant = 600
        unitView.isHidden = true
        sendView.isHidden = true
        powerpacks.isHidden = true
        crankView.isHidden = true
        bracketview.isHidden = true
        inView.isHidden = true

       
        showText()
        
  
        choiceView.isRightToLeft = false // use it to support right to left language
        
        choiceView.delegate = self // the delegate used to get the selected item when pressed
        
        choiceView.data = myItems // fill your item , the item may come from server or static in your code like i have done
        
        choiceView.selectionType = .single // selection type , single or multiple
        
        choiceView.cellHeight = 40// to set cell hight
        
        choiceView.arrowImage = nil // use ot if you want to add arrow to the cell
        
        // you can set the selected and unselected image programmatically
        
        choiceView.selectedImage = UIImage(named: "checked")
        choiceView.unselectedImage = UIImage(named: "unchecked")
        
        //self.choiceView.frame = CGRect(x: 0, y: 390, width: self.view.frame.width, height: self.view.frame.height)
     //battery
        
        batteryDrop.bottomOffset = CGPoint(x: 5, y: (cusBattery?.frame.height)!)
        batteryDrop.anchorView = cusBattery
        batteryDrop.direction = .bottom
        batteryDrop.width = cusBattery?.frame.width
        
        batteryDrop.dataSource = ["Yes","No"]
        
        
        batteryDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.batteryDropNameOn(index: index, item: item)
        }
        
      //length
        
        lengthDrop.bottomOffset = CGPoint(x: 5, y: (length?.frame.height)!)
        lengthDrop.anchorView = length
        lengthDrop.direction = .bottom
        lengthDrop.width = length?.frame.width
        
        lengthDrop.dataSource = ["  "," "]
        
        
        lengthDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lengthDropNameOn(index: index, item: item)
        }
        
       //rooftop
        
        roofDrop.bottomOffset = CGPoint(x: 5, y: (roofTop?.frame.height)!)
        roofDrop.anchorView = roofTop
        roofDrop.direction = .bottom
        roofDrop.width = roofTop?.frame.width
        
        roofDrop.dataSource = ["  "," "]
        
        
        roofDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.roofDropNameOn(index: index, item: item)
        }
        
       //compressor
        
        compressorDrop.bottomOffset = CGPoint(x: 5, y: (compressorMdl?.frame.height)!)
        compressorDrop.anchorView = compressorMdl
        compressorDrop.direction = .bottom
        compressorDrop.width = compressorMdl?.frame.width
        
        compressorDrop.dataSource = ["  "," "]
        
        
        compressorDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.compressorDropNameOn(index: index, item: item)
        }
        
       // alternetor
        
        alternetorDrop.bottomOffset = CGPoint(x: 5, y: (alternatorMdl?.frame.height)!)
        alternetorDrop.anchorView = alternatorMdl
        alternetorDrop.direction = .bottom
        alternetorDrop.width = alternatorMdl?.frame.width
        
        alternetorDrop.dataSource = ["  "," "]
        
        
        alternetorDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.alternetorDropNameOn(index: index, item: item)
        }
        
        //cooling capacity
        
        coolingDrop.bottomOffset = CGPoint(x: 5, y: (coolingCapacity?.frame.height)!)
        coolingDrop.anchorView = coolingCapacity
        coolingDrop.direction = .bottom
        coolingDrop.width = coolingCapacity?.frame.width
        
        coolingDrop.dataSource = ["  "," "]
        
        
        coolingDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.coolingDropNameOn(index: index, item: item)
        }
        
       serviceCall()
    //   serviceCallLength()
        
        // Do any additional setup after loading the view.
    }
   
    
    func showText()
    {
        subViewHeading.text = txt
    }
    
    
    
    func batteryDropNameOn(index: Int, item: String)
    {
        
        cusBattery?.text = item
    }
    
    func lengthDropNameOn(index: Int, item: String)
    {
        length.text = item
       // wheelBase?.text = item
        
        for itemValue in displayLengthNamedictArray
        {
            let obj = itemValue as NSDictionary
            let name = obj.object(forKey: "ACSpace")as! String
            if name == item
            {
//                let Application_Id : Int = obj.object(forKey: "ApplicationId")as? Int ?? 0
//                let stringApplication_Id = "\(Application_Id)"
//                
//                print(obj.object(forKey: "ACSpace"))
                
                
                length.text = obj.object(forKey: "ACSpace")as? String ?? ""
                
            }
            
        }
        
        
    }
    
    func compressorDropNameOn(index: Int, item: String)
    {
     compressorMdl.text = item
    
    }
    
    func roofDropNameOn(index: Int, item: String)
    {
        roofTop.text = item
        
    }
    
    func alternetorDropNameOn(index: Int, item: String)
    {
        alternatorMdl.text = item
        
    }
    
    func coolingDropNameOn(index: Int, item: String)
    {
        coolingCapacity.text = item
        
    }
    
    
    
    func didSelectRowAt(indexPath: IndexPath)
    {
        if (indexPath.row == 0)
        {
           // myheight.constant = 660
            bracketview.isHidden = false
            crankView.isHidden =  false
            powerpacks.isHidden = true
            

        }
            
        else if(indexPath.row == 1)
        {
           // myheight.constant = 600
            
            bracketview.isHidden = true
            crankView.isHidden =  true
            powerpacks.isHidden = false
            
           
            
        }
    }
    
    func serviceCall()
    {
        functionCall.delegete = self
        functionCall.getserviceCall(param:[ "ApplicationId": "",
                                            "CoolCapacityId": "",
                                            "TemeratureId": "",
                                            "TruckStatus": "True",
                                            "Type": "Power Pack",
                                            "ValidationStatus": "Temperature",
                                            "Volume_id": "" ], tpye: TransACNRBaseTestUrl + TransACNRUnitDetail as NSString)
    }
    
//    func serviceCallLength()
//    {
//
//        functionCall.delegete = self
//        functionCall.getserviceCall(param: ["TruckStatus": "True"], tpye: TransACNRBaseTestUrl + TransACNRUnitDetail as NSString)
//
//    }
    
    
    
    func GetServiceRespone(param: NSDictionary)
    {
        
        print(param)
        if let value = param["ACSpace"]
        {
            
            displayLengthNamedictArray.removeAll()
            displayLengthNameArray.removeAll()
            for item in value as! Array<Any>
            {
                
                let obj = item as! NSDictionary
                
                displayLengthNamedictArray.append(obj)
                displayLengthNameArray.append(obj.object(forKey: "ACSpace") as! String)
                
            }
        }
        
        if displayLengthNameArray.count > 0
        {
            
            lengthDrop.dataSource = displayLengthNameArray
            
        }
        
    }
    
    
    
    
    
   
    @IBOutlet weak var segmentOut: UISegmentedControl!
    

    @IBAction func segmentValue(_ sender: UISegmentedControl)
        
    {
        if segmentOut.selectedSegmentIndex == 0
        {
            self.choiceView.frame = CGRect(x: 0, y: 390, width: self.view.frame.width, height: self.view.frame.height)
            self.bracketview.frame = CGRect(x: 0, y: 480, width: self.view.frame.width, height: self.view.frame.height)
            self.powerpacks.frame = CGRect(x: 0, y: 480, width: self.view.frame.width, height: self.view.frame.height)
            self.crankView.frame = CGRect(x: 0, y: 530, width: self.view.frame.width, height: self.view.frame.height)
            
           unitView.isHidden = true
           sendView.isHidden = true
            
          // drop down button unhide
            lenbtn.isHidden = false
            btncompressor.isHidden = false
            btnalternetor.isHidden = false
            btncapacity.isHidden = false
            btnroof.isHidden = false
            
        }
        
         if segmentOut.selectedSegmentIndex == 1
         {
            myheight.constant = 700
             unitView.isHidden = false
            sendView.isHidden = false
            
            //dropdown button hide
            
            lenbtn.isHidden = true
            btnroof.isHidden = true
            btncapacity.isHidden = true
            btnalternetor.isHidden = true
            btncompressor.isHidden = true
            
            self.sendView.frame = CGRect(x: 0, y: 630, width: self.view.frame.width, height: self.view.frame.height)
            self.choiceView.frame = CGRect(x: 0, y: 440, width: self.view.frame.width, height: self.view.frame.height)
            self.bracketview.frame = CGRect(x: 0, y: 530, width: self.view.frame.width, height: self.view.frame.height)
            self.powerpacks.frame = CGRect(x: 0, y: 530, width: self.view.frame.width, height: self.view.frame.height)
            self.crankView.frame = CGRect(x: 0, y: 580, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    @IBAction func bracketCancelBtn(_ sender: UIButton)
    {
        if (inView.isHidden == true)
        {
            inView.isHidden = false
            mainUnitView.isHidden = true
        }
            
        else
        {
            inView.isHidden = true
            mainUnitView.isHidden = false
        }
    }
    
 
    
    
    @IBOutlet weak var nxtbutton: UIButton!
    
    @IBAction func bracketbtn(_ sender: UIButton)
    {
        txt = "BRACKET"
        showText()

        if (inView.isHidden == false)
        {
            inView.isHidden = true
            mainUnitView.isHidden = false
         
            
        }
            
        else
        {
            inView.isHidden = false
            mainUnitView.isHidden = true
        }
        
       
    }
    
    @IBAction func powerPackBtn(_ sender: UIButton)
    
    {
        txt = "POWER PACKS"
        showText()
        
        if (inView.isHidden == false)
        {
            inView.isHidden = true
            mainUnitView.isHidden = false
            
            
        }
            
        else
        {
            inView.isHidden = false
            mainUnitView.isHidden = true
        }
        
        
    }
    
    @IBAction func backNaviUnit(_ sender: UIButton)
    {
        _=navigationController?.popViewController(animated: true)
    }
    
    @IBAction func batteryAction(_ sender: UIButton)
    {
        batteryDrop.show()
        
    }
    
    @IBAction func lengthAction(_ sender: UIButton)
    {
        lengthDrop.show()
    }
    
    @IBAction func roofTopAction(_ sender: UIButton)
    {
        roofDrop.show()
        
    }
    
    @IBAction func compressorAction(_ sender: UIButton)
    {
        compressorDrop.show()
    }
    
    @IBAction func alternetorAction(_ sender: UIButton)
    {
        alternetorDrop.show()
    }
    
    @IBAction func coolingCapacityAction(_ sender: UIButton)
    {
        coolingDrop.show()
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
