//
//  VehicleDetails.swift
//  scroll
//
//  Created by Arunbabu.j on 5/8/18.
//  Copyright © 2018 Arunbabu.j. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import DropDown

class VehicleDetailsVc: UIViewController,UITextFieldDelegate,GetResultResponse
{
    
    
    
    let functionCall = GetRespone()
    var txt = " "
    
    var displayNamedictArray : [NSDictionary] = []
    var displayNameArray : [String] = []
    
    var displayWheelNamedictArray : [NSDictionary] = []
    var displayWheelNameArray : [String] = []
    
    
    var callWheelBase :Bool = false
    var callChassis : Bool = false
    
    let voltageDrop = DropDown()
    let powerDrop = DropDown()
    let heaterDrop = DropDown()
    let chassisDrop = DropDown()
    let wheelbaseDrop = DropDown()
    let airbrakeDrop = DropDown()
    let driverPartitionDrop = DropDown()

        // Do any additional setup after loading the view.
    
    @IBOutlet weak var mainVehicleView: UIView!
    @IBOutlet weak var subVehicleView: UIView!
    @IBOutlet weak var subLabelHeading: UILabel!
    
    @IBOutlet weak var chassisModel: UITextField!
    @IBOutlet weak var wheelBase: UITextField!
    @IBOutlet weak var voltagetxt: SkyFloatingLabelTextField!
    
    @IBOutlet weak var powersteering: UITextField!
    @IBOutlet weak var airBrake: UITextField!
    @IBOutlet weak var driverpartition: UITextField!
    @IBOutlet weak var seatingCapacity: UITextField!
    @IBOutlet weak var sleepercapacity: UITextField!
    @IBOutlet weak var heater: UITextField!

override func viewDidLoad()
{
    super.viewDidLoad()
    subVehicleView.isHidden = true
     showText()
     //serviceCall()
    
    serviceCallChassis()
    serviceCallWheelbase()
    
    // Chassis Model
    
    chassisDrop.bottomOffset = CGPoint(x: 5, y: (chassisModel?.frame.height)!)
    chassisDrop.anchorView = chassisModel
    chassisDrop.direction = .bottom
    chassisDrop.width = chassisModel?.frame.width
    
       //  chassisDrop.dataSource = [" "," " ]
    
    
    chassisDrop.selectionAction = { [unowned self] (index: Int, item: String) in
        self.chassisDropNameOn(index: index, item: item)
    }
    
    // WheelBase
    
    wheelbaseDrop.bottomOffset = CGPoint(x: 5, y: (wheelBase?.frame.height)!)
    wheelbaseDrop.anchorView = wheelBase
    wheelbaseDrop.direction = .bottom
    wheelbaseDrop.width = wheelBase?.frame.width
    
    //  wheelbaseDrop.dataSource = [ " "," " ]
    
    
    wheelbaseDrop.selectionAction = { [unowned self] (index: Int, item: String) in
        self.wheelbaseDropNameOn(index: index, item: item)
    }
    
    
    //voltage

    voltageDrop.bottomOffset = CGPoint(x: 5, y: (voltagetxt?.frame.height)!)
    voltageDrop.anchorView = voltagetxt
    voltageDrop.direction = .bottom
    voltageDrop.width = voltagetxt?.frame.width

    voltageDrop.dataSource = ["12V","24V"]


    voltageDrop.selectionAction = { [unowned self] (index: Int, item: String) in
        self.voltageDropNameOn(index: index, item: item)
    }
    
   //power steering

    powerDrop.bottomOffset = CGPoint(x: 5, y: (powersteering?.frame.height)!)
    powerDrop.anchorView = powersteering
    powerDrop.direction = .bottom
    powerDrop.width = powersteering?.frame.width
    
    powerDrop.dataSource = ["Yes","No"]

    
    powerDrop.selectionAction = { [unowned self] (index: Int, item: String) in
        self.powerDropNameOn(index: index, item: item)
    }

  
    
    
    // Air brake
    
    airbrakeDrop.bottomOffset = CGPoint(x: 5, y: (airBrake?.frame.height)!)
    airbrakeDrop.anchorView = airBrake
    airbrakeDrop.direction = .bottom
    airbrakeDrop.width = airBrake?.frame.width
    
    airbrakeDrop.dataSource = ["Yes","No"]
    
    
    airbrakeDrop.selectionAction = { [unowned self] (index: Int, item: String) in
        self.airbrakeDropNameOn(index: index, item: item)
    }
    
   //  Driver Partition

        driverPartitionDrop.bottomOffset = CGPoint(x: 5, y: (driverpartition?.frame.height)!)
        driverPartitionDrop.anchorView = driverpartition
        driverPartitionDrop.direction = .bottom
        driverPartitionDrop.width = driverpartition?.frame.width

        driverPartitionDrop.dataSource = ["Yes","No"]


        driverPartitionDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.driverPartitionDropNameOn(index: index, item: item)
        }


//    // heater

    heaterDrop.bottomOffset = CGPoint(x: 5, y: (heater?.frame.height)!)
    heaterDrop.anchorView = heater
    heaterDrop.direction = .bottom
    heaterDrop.width = heater?.frame.width

    heaterDrop.dataSource = ["RoofTop Heater","Floor Heater"]


    heaterDrop.selectionAction = { [unowned self] (index: Int, item: String) in
        self.heaterDropNameOn(index: index, item: item)
    }
}
//    func serviceCall()
//    {
//
//        //callWheelBase = true
//        functionCall.delegete = self
//        functionCall.getserviceCall(param: [:], tpye: TransACNRBaseTestUrl  as NSString)
//
//    }
    
    func serviceCallChassis()
    {
     
    callChassis = true
    callWheelBase = false
    functionCall.delegete = self
    functionCall.getserviceCall(param: [:], tpye: TransACNRBaseTestUrl + TransACNRVehicleChassisModelDetails as NSString)
    
  
        
    }
    
    
    func serviceCallWheelbase()
    {
        
        
        callWheelBase = true
       // callChassis = false
        functionCall.delegete = self
        functionCall.getserviceCall(param: [:], tpye: TransACNRBaseTestUrl + TransACNRVehicleWheelBase as NSString)
    }

    
    func chassisDropNameOn(index: Int, item: String)
    {
        
            chassisModel?.text = item
        
        for itemValue in displayNamedictArray
       {
            
            let obj = itemValue as NSDictionary
            let name = obj.object(forKey: "Chase_Model") as! String
            
            if name == item
            {
//                let ChaiseModel_Id : Int = obj.object(forKey: "Chaise_Model_Id")as? Int ?? 0
//                let stringChaiseModel_Id = "\(ChaiseModel_Id)"
                
             
              
                
                chassisModel.text = obj.object(forKey: "Chase_Model")as? String ?? ""
                
            }
        }
        
    }

    func wheelbaseDropNameOn(index: Int, item: String)
    {

      wheelBase?.text = item

        for itemValue in displayWheelNamedictArray
        {
             let obj = itemValue as NSDictionary
            let name = obj.object(forKey: "Wheel_Base")as! String
            if name == item
            {
                let wheelBase_Id : Int = obj.object(forKey: "Wheel_Base_Id")as? Int ?? 0
                let stringwheelBase_Id = "\(wheelBase_Id)"

                print(obj.object(forKey: "Wheel_Base"))


                wheelBase.text = obj.object(forKey: "Wheel_Base")as? String ?? ""

            }

        }
        
     }
    
    
    
    
    
    
    
    
    func GetServiceRespone(param: NSDictionary)
    {
        print(param)
        
        if callChassis
            {
                if let value = param["ChasisimakeModel"]
                {
                    displayNamedictArray.removeAll()
                    displayNameArray.removeAll()
                    for item in value as! Array<Any>
                    {
            
                        let obj = item as! NSDictionary
            
                        displayNamedictArray.append(obj)
                        displayNameArray.append(obj.object(forKey: "Chase_Model") as! String)
            
                    }
                }
    
                if displayNameArray.count > 0
                {

                    chassisDrop.dataSource = displayNameArray
                    serviceCallWheelbase()
           
                }
                    callChassis = false
            }
        
        
        
     if callWheelBase
         {
            if let value = param["WheelBase"]
            {
                
                displayWheelNamedictArray.removeAll()
                displayWheelNameArray.removeAll()
                for item in value as! Array<Any>
                {
                    
                    let obj = item as! NSDictionary
                    
                    displayWheelNamedictArray.append(obj)
                    displayWheelNameArray.append(obj.object(forKey: "Wheel_Base") as! String)
                    
                }
            }
            
            if displayWheelNameArray.count > 0
            {
                
                wheelbaseDrop.dataSource = displayWheelNameArray
              
            }
            
           callWheelBase = false
            
            
        }
        
    }
    

    func voltageDropNameOn(index: Int, item: String)
    {

        voltagetxt?.text = item
    }

    func powerDropNameOn(index: Int, item: String)
    {
        powersteering?.text = item
    }

    func heaterDropNameOn(index: Int, item: String)
    {
        heater?.text = item
    }


    
    
    func airbrakeDropNameOn(index: Int, item: String)
    {
        airBrake?.text = item
    }
    


    func driverPartitionDropNameOn(index: Int, item: String)
    {
        driverpartition?.text = item
    }

    func showText()
    {
        subLabelHeading.text = txt
    }
    
    
    
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
 
    
    @IBAction func chassisAction(_ sender: UIButton)
    {
       
        chassisDrop.show()
    }
    
    @IBAction func wheelBaseAction(_ sender: UIButton)
    {
        wheelbaseDrop.show()
        
    }
    
    @IBAction func voltageAction(_ sender: UIButton)
    {
        voltageDrop.show()
        
    }
    
    @IBAction func powerSteeringAction(_ sender: UIButton)
    {
        powerDrop.show()
    }
    
    
    
    @IBAction func heaterAction(_ sender: UIButton)
    {
        heaterDrop.show()
    }
    
    @IBAction func airbrakeAction(_ sender: UIButton)
    {
        airbrakeDrop.show()
    }
    
    
    @IBAction func driverpartitionAction(_ sender: UIButton)
    {
        driverPartitionDrop.show()
    }
    
    
    @IBAction func backNaviVehicle(_ sender: UIButton)
    {
        _=navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func btnpress(_ sender: UIButton)
    {
        
      //  performSegue(withIdentifier: "gotounit", sender: self)
    }
    
    @IBAction func chassisBtn(_ sender: UIButton)
    {
        txt = "CHASSIS MODEL"
        showText()
        if(subVehicleView.isHidden == true)
        {
            subVehicleView.isHidden = false
            mainVehicleView.isHidden = true
            
        }
        else
        {
            subVehicleView.isHidden = true
            mainVehicleView.isHidden = false
        }
        
        
    }
    
    @IBAction func wheelBaseBtn(_ sender: UIButton)
    {
        txt = "WHEEL BASE"
        showText()
        if(subVehicleView.isHidden == true)
        {
            subVehicleView.isHidden = false
            mainVehicleView.isHidden = true
            
        }
        else
        {
            subVehicleView.isHidden = true
            mainVehicleView.isHidden = false
        }
    }
    
    
    @IBAction func subViewBtn(_ sender: UIButton)
    {
        if(subVehicleView.isHidden == false)
        {
            subVehicleView.isHidden = true
            mainVehicleView.isHidden = false
            
        }
        else
        {
            subVehicleView.isHidden = false
            mainVehicleView.isHidden = true
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   }
