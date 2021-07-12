//
//  CustomerDetails.swift
//  scroll
//
//  Created by Arunbabu.j on 5/7/18.
//  Copyright © 2018 Arunbabu.j. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import DropDown

class CustomerDetailsVc: UIViewController ,UITextFieldDelegate,GetResultResponse
{
  
    let functionCall = GetRespone()
    let customerNameDrop = DropDown()
    var displayNameArray : [String] = []
    var displayNamedictArray : [NSDictionary] = []
   // var callback :Bool = false
    var callautofillName :Bool = false
    
   
    @IBOutlet weak var customerNameTxtFd: SkyFloatingLabelTextField!
    
    @IBOutlet weak var customerCode: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var dealingPerson: UITextField!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var pan: UITextField!
    @IBOutlet weak var gst: UITextField!
    @IBOutlet weak var emailid: UITextField!
    @IBOutlet weak var addres: UITextView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        serviceCall()
        
        customerNameDrop.bottomOffset = CGPoint(x: 5, y:(customerNameTxtFd?.frame.height)!)
        customerNameDrop.anchorView = customerNameTxtFd
        customerNameDrop.direction = .bottom
        customerNameDrop.width = customerNameTxtFd?.frame.width

      //  customerNameDrop.dataSource = [" "," "]
        customerNameDrop.selectionAction = { [unowned self] (index: Int, item: String) in
        self.customerNameOn(index: index, item: item)

        }
        
        // Do any additional setup after loading the view.
    }
    
    
  
    func serviceCallAutocall(passText : String)  {
        callautofillName = true
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceAutoCallRepresenation(stringData: passText), tpye: TransACNRBaseTestUrl+TransACNRAutoCompleteByCustomer as NSString)
    }
    
    func serviceCall()
    {
        functionCall.delegete = self
        functionCall.getserviceCall(param: [:], tpye: TransACNRBaseTestUrl + TransACNREnquiryCustomerDetails as NSString)
    }
    
    
    func customerNameOn(index: Int, item: String)
    {
        
        customerNameTxtFd.resignFirstResponder()

        customerNameTxtFd?.text = item
        

        for itemValue in displayNamedictArray
        {
            let obj = itemValue as NSDictionary
            let name = obj.object(forKey: "Customer_Name") as! String


            if name == item {


//                let Customer_Id : Int = obj.object(forKey: "Customer_Id")as? Int ?? 0
//                let stringCustomer_Id = "\(Customer_Id)"
//                
//                print(obj.object(forKey: "Customer_Name"))
//                print(obj.object(forKey: "Customer_Code"))
//                 print(obj.object(forKey: "Mobile_No"))
//                print(obj.object(forKey: "Phone_No"))
//                print(obj.object(forKey: "Pan_No"))
//                print(obj.object(forKey: "Customer_Address"))
//                print(obj.object(forKey: "Tin_No"))

                customerNameTxtFd.text = obj.object(forKey: "Customer_Name")as? String ?? ""
                customerCode.text = obj.object(forKey: "Customer_Code")as? String ?? ""
                mobileNumber.text = obj.object(forKey: "Mobile_No")as? String ?? ""
                addres.text = obj.object(forKey: "Customer_Address")as? String ?? ""
                gst.text = obj.object(forKey: "Tin_No")as? String ?? ""
                pan.text = obj.object(forKey: "Pan_No")as? String ?? ""
                phoneNo.text = obj.object(forKey: "Phone_No")as? String ?? ""
                emailid.text = obj.object(forKey: "Email")as? String ?? ""

            }
        }




    }


  
    
    func GetServiceRespone(param: NSDictionary)
    {
        print(param)
        
        customerCode.text = param["CustomerCode"] as? String ?? ""
       
//        if callback {
//
//
//            if let value = param["ServiceDetaills"]
//            {
//
//                let objPASS = value as! NSArray
//
//
//                let obj = objPASS[0] as! NSDictionary
//
//
//                customerCode.text = obj .object(forKey: "Customer_Code") as? String ?? ""
//                CustomerName.text = obj .object(forKey: "Customer_Name") as? String ?? ""
//
//                mobileNumber.text = obj .object(forKey: "Contact_Details") as? String ?? ""
//
//                addres.text = obj .object(forKey: "Customer_Address") as? String ?? ""
//
//
//            }
//            callback = false
//
//        }
         if callautofillName
        {
            if let value = param["CustomerAutoComplete"]
            {

                displayNamedictArray.removeAll()
                displayNameArray.removeAll()
                for item in value as! Array<Any>
                {

                    let obj = item as! NSDictionary

                    displayNamedictArray.append(obj)
                    displayNameArray.append(obj.object(forKey: "Customer_Name") as! String)

                }
            }

            if displayNameArray.count > 0
            {

                customerNameDrop.dataSource = displayNameArray
                customerNameDrop.show()

            }

            callautofillName = false
    }


        
    }
    
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if textField == customerNameTxtFd && (customerNameTxtFd.text?.characters.count)! > 1{
            
            
            if let text = textField.text,
                let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange,
                                                           with: string)
                
                if updatedText.characters.count > 2{
                    
                    
                    serviceCallAutocall(passText:updatedText)
                }
                
            }
            
        }
       return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func nxtbtn(_ sender: UIButton)
    {
        
        if customerNameTxtFd.text == "" || customerCode.text == "" || mobileNumber.text == ""
        {
            
            let alert = UIAlertController(title: "error", message: "* Required fields are to be filled", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert,animated: true,completion: nil)
        }
        else
        {
            performSegue(withIdentifier: "gotovehicle", sender: self)
        }
    }
    
    
    @IBAction func backNaviCustomer(_ sender: UIButton)
    {
        _=navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addCustomerbtn(_ sender: UIButton)
    {
        let storyboard: UIStoryboard = UIStoryboard(name: "AddPerson", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addPersonVC") as! AddPersonVC
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension  CustomerDetailsVc
{

    func ServiceAutoCallRepresenation(stringData:String) -> [String : Any] {

        let parameters:[String : Any] = ["Customer_Name":stringData,"Branch_Id":userDefaults.GET_USERDEFAULTS(objectValue: "Branch_Id")]
        return parameters as [String : Any]

    }

}


