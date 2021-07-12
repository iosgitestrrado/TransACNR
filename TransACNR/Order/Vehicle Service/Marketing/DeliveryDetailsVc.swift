//
//  DeliveryDetails.swift
//  scroll
//
//  Created by Arunbabu.j on 5/10/18.
//  Copyright © 2018 Arunbabu.j. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import DropDown

class DeliveryDetailsVc: UIViewController , UITextFieldDelegate,AMChoiceDelegate
{
    
    
    let myItems = [
        VoteModel(title: "By us", isSelected: false, isUserSelectEnable: true),
        VoteModel(title: "Third Party/Dealer", isSelected: false, isUserSelectEnable: true)]
    
    let installerDrop = DropDown()
    
    @IBOutlet weak var mainDeliveryView: UIView!
    @IBOutlet weak var subDeliveryView: UIView!
    
    // option button views
    
    @IBOutlet weak var choiceDelivery: AMChoice!
    @IBOutlet weak var byUsAddress: UIView!
    @IBOutlet weak var thirdPartyAddress: UIView!
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var thirdPartyNameView: UIView!
    @IBOutlet weak var gstView: UIView!
    @IBOutlet weak var installationView: UIView!
    @IBOutlet weak var contactPersonView: UIView!
    @IBOutlet weak var phoneNoView: UIView!
    
    
    
    
    @IBOutlet weak var placeOfDelivery: UITextField!
    @IBOutlet weak var installation: UITextField!
    @IBOutlet weak var installerBranch: UITextField!
    @IBOutlet weak var builderName: UITextField!
    @IBOutlet weak var builderAddress: UITextField!
    @IBOutlet weak var tentativeDate: UITextField!
    @IBOutlet weak var gst: UITextField!
    @IBOutlet weak var nameDealingPerson: UITextField!
    @IBOutlet weak var mobileNo: UITextField!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var remarks: UITextField!
    
    
    
  
    
    override func viewDidLoad()
        
    {
        super.viewDidLoad()
        viewHeight.constant = 900
        subDeliveryView.isHidden = true
     
        installationView.isHidden = true
        thirdPartyNameView.isHidden =  true
        byUsAddress.isHidden = true
        gstView.isHidden = true
        contactPersonView.isHidden = true
        phoneNoView.isHidden = true
        thirdPartyAddress.isHidden = true
        
        choiceDelivery.isRightToLeft = false // use it to support right to left language
        
        choiceDelivery.delegate = self // the delegate used to get the selected item when pressed
        
        choiceDelivery.data = myItems // fill your item , the item may come from server or static in your code like i have done
        
        choiceDelivery.selectionType = .single // selection type , single or multiple
        
        choiceDelivery.cellHeight = 40// to set cell hight
        
        choiceDelivery.arrowImage = nil // use ot if you want to add arrow to the cell
        
        // you can set the selected and unselected image programmatically
        
        choiceDelivery.selectedImage = UIImage(named: "checked")
        choiceDelivery.unselectedImage = UIImage(named: "unchecked")
        
        // installer
        
        installerDrop.bottomOffset = CGPoint(x: 5, y: (installerBranch?.frame.height)!)
        installerDrop.anchorView = installerBranch
        installerDrop.direction = .bottom
        installerDrop.width = installerBranch?.frame.width
        
        installerDrop.dataSource = ["  "," "]
        
        
        installerDrop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.installerDropNameOn(index: index, item: item)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
        
    }
    
    func didSelectRowAt(indexPath: IndexPath)
    {
        if (indexPath.row == 0)
        {
            viewHeight.constant = 900
            
            byUsAddress.isHidden = false
            installationView.isHidden = true
            thirdPartyNameView.isHidden =  true
            thirdPartyAddress.isHidden = true
            gstView.isHidden = true
            contactPersonView.isHidden = true
            phoneNoView.isHidden = true
            
        }
            
        else if(indexPath.row == 1)
        {
            
            viewHeight.constant = 1150
            
            byUsAddress.isHidden = true
            installationView.isHidden = false
            thirdPartyNameView.isHidden =  false
            thirdPartyAddress.isHidden = false
            gstView.isHidden = false
            contactPersonView.isHidden = false
            phoneNoView.isHidden = false
            
        }
    }
    
    
    
    func installerDropNameOn(index: Int, item: String)
    {
        installerBranch.text = item
    }
    
    
    

    
    @IBAction func submitbtn(_ sender: UIButton)
    {
        
        if builderName.text == ""
        {
            let alert = UIAlertController(title: "error", message: " * Required fields are to be filled", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert,animated: true,completion: nil)
            
            
        }
        
        
    }
    
    
    @IBAction func cancelDelvryDetail(_ sender: Any)
    {
       _=navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backNaviDelivery(_ sender: UIButton)
    {
       _=navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func installerAction(_ sender: UIButton)
    {
        installerDrop.show()
    }
    
    @IBAction func builderNameBtn(_ sender: UIButton)
    {
        if(subDeliveryView.isHidden == true)
        {
            subDeliveryView.isHidden = false
            mainDeliveryView.isHidden = true
        }
        
        else
        {
            subDeliveryView.isHidden = true
            mainDeliveryView.isHidden = false
        }
    }
    
    
    @IBAction func builderNameCancel(_ sender: UIButton)
    {
        if(subDeliveryView.isHidden == false)
        {
            subDeliveryView.isHidden = true
            mainDeliveryView.isHidden = false
        }
            
        else
        {
            subDeliveryView.isHidden = false
            mainDeliveryView.isHidden = true
        }
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
