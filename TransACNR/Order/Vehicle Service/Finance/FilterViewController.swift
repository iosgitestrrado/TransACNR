//
//  ViewController.swift
//  Filter
//
//  Created by Arunbabu.j on 29/05/18.
//  Copyright © 2018 Arunbabu.j. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

protocol filterAddDelegate: class {
    func filterreloaded()
}





class FilterViewController: UIViewController
    
{
@IBOutlet weak var frmdate: UITextField!
@IBOutlet weak var todate: UITextField!
    @IBOutlet weak var customerName: SkyFloatingLabelTextField!
    @IBOutlet weak var jobCardNo: SkyFloatingLabelTextField!
    @IBOutlet weak var vehicleNo: SkyFloatingLabelTextField!
    @IBOutlet weak var unitSerial: SkyFloatingLabelTextField!
    var delegateAdd: filterAddDelegate? = nil
    
    
    
    @IBAction func cancelBtn(_ sender: UIButton)
    {
         self.view .removeFromSuperview()
        
    }
    
    @IBAction func searchBtn(_ sender: UIButton)
    {
        
        newSharedInstance.filterUpdate(filterFromDateInit: frmdate.text!, filterToDateInit: todate.text!, filterCustomerNameInit: customerName.text!, filterJobCardNumberInit: jobCardNo.text!, filterVehiclenumberInit: vehicleNo.text!, filterUnitSerialInit: unitSerial.text!)
        delegateAdd?.filterreloaded()
        self.view .removeFromSuperview()
        
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
      //  self.view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        
        self.showAnimate()
        
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        frmdate.inputView = datePickerView
         datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        
        let datePickerView1 = UIDatePicker()
        datePickerView1.datePickerMode = .date
        todate.inputView = datePickerView1;
        datePickerView1.addTarget(self, action: #selector(handleDatePicker1(sender:)), for: .valueChanged)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tapGestureaction(_ sender: Any) {
        self.view .removeFromSuperview()
        
        
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        frmdate.text = dateFormatter.string(from: sender.date)
       
    }
    
    @objc func handleDatePicker1(sender: UIDatePicker)
    {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd MMM yyyy"
        todate.text = dateFormatter1.string(from: sender.date)
        
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations:
            {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    
    
    }
    
    
    /*
     
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        frmdate.text = dateFormatter.string(from: sender.date)
    }
    
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

