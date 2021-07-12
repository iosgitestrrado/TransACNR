//
//  ViewController.swift
//  scroll
//
//  Created by Arunbabu.j on 5/7/18.
//  Copyright © 2018 Arunbabu.j. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import DropDown
//import SkyFloatingLabelTextField

class EnquiryVc: UIViewController ,UITextFieldDelegate,GetResultResponse
{
    
    
    
let functionCall = GetRespone()
let enquiryCategoryDrop = DropDown()
let enquiryTypeDrop = DropDown()
    
    
        // Do any additional setup after loading the view, typically from a nib.
    
    
    @IBOutlet weak var enquiryNo: UITextField!
    @IBOutlet weak var selectCategory: UITextField!
    @IBOutlet weak var enquiryType: UITextField!
    @IBOutlet weak var branch: UITextField!
    @IBOutlet weak var poc: UITextField!
    @IBOutlet weak var date: UITextField!
    

override func viewDidLoad()
{
    super.viewDidLoad()
    
//    let datePickerView = UIDatePicker()
//    datePickerView.datePickerMode = .date
//    date.inputView = datePickerView
//    datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    
   //enquiry Category
    enquiryCategoryDrop.bottomOffset = CGPoint(x: 5, y: (selectCategory?.frame.height)!)
    enquiryCategoryDrop.anchorView = selectCategory
    enquiryCategoryDrop.direction = .bottom
    enquiryCategoryDrop.width = selectCategory?.frame.width
    
    enquiryCategoryDrop.dataSource = ["OEM Supply","Body Builder","Retail"]
    
    
    enquiryCategoryDrop.selectionAction = { [unowned self] (index: Int, item: String) in
        self.enquiryCategoryNameOn(index: index, item: item)
        }
  // enquiry type
  
        self.enquiryTypeDrop.bottomOffset = CGPoint(x: 5, y: (self.enquiryType?.frame.height)!)
        self.enquiryTypeDrop.anchorView = self.enquiryType
        self.enquiryTypeDrop.direction = .bottom
        self.enquiryTypeDrop.width = self.enquiryType?.frame.width
        
        self.enquiryTypeDrop.dataSource = ["Bus","Truck"]
        
        
        self.enquiryTypeDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.enquiryTypeNameOn(index: index, item: item)
            }
    
    serviceCall()
    handleDatePicker( )
    setupUI()
    }
    
    func setupUI()
    {
       branch.text = userDefaults.GET_USERDEFAULTS(objectValue: "BranchName")
       poc.text = userDefaults.GET_USERDEFAULTS(objectValue: "UserName")
    }
    
    
    
    
    
     func handleDatePicker( )
    {
        date.text = HelperClass.datefromString(dateString:NSDate() as Date, typeofFormatting: "dd/MM/yyyy")
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd MMM yyyy"
//        date.text = dateFormatter.string(from: sender.date)
    }
        
    
    func enquiryCategoryNameOn(index: Int, item: String)
    {
        
        selectCategory?.text = item
    }

    func enquiryTypeNameOn(index: Int, item: String)
   {
    
   
    enquiryType?.text = item
        
        
   }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    
    func serviceCall()
    {
        functionCall.delegete = self
        functionCall.getserviceCall(param: [:], tpye: TransACNRBaseTestUrl + TransACNRNewEnquiry as NSString)
    }
    
    
    func GetServiceRespone(param: NSDictionary)
    {
        print(param)
        
        enquiryNo.text = param["EnquiryCode"] as? String ?? ""
        
        
    }
    

    
    @IBAction func NewEnqbtn(_ sender: UIButton)
    {
        
         
        if enquiryNo.text == "" || selectCategory.text == "" || enquiryType.text == "" || branch.text == "" || poc.text == "" || date.text == ""
            
        {
            let alert = UIAlertController(title: "Error", message: "* Required fields are to be filled", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
            
        else
        {
            performSegue(withIdentifier: "gotocustomer", sender: self)
        }
     
        
    }
    
  
    
    @IBAction func backNavigationBtn(_ sender: UIButton) {
        
        _=navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func enquiryCategoryAction(_ sender: UIButton)
    {
        enquiryCategoryDrop.show()
        
    }
    
    @IBAction func enquiryTypeAction(_ sender: UIButton)
    {
        enquiryTypeDrop.show()
    }
    
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

