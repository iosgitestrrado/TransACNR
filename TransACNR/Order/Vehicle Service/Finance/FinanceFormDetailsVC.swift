//
//  ViewController.swift
//  New
//
//  Created by Arunbabu.j on 04/06/18.
//  Copyright © 2018 Arunbabu.j. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class FinanceFormDetailsVC: UIViewController,UITextFieldDelegate,AMChoiceDelegate,GetResultResponse,UITableViewDelegate,UITableViewDataSource
    
{
var seguefromModel :DetailModel = DetailModel()
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var amChoiceView: AMChoice!
    @IBOutlet weak var chequePaymentView: UIView!
    
    @IBOutlet weak var bankTransferView: UIView!
    
    @IBOutlet weak var draftPaymentView: UIView!
    @IBOutlet weak var cardPayment: UIView!
    
    @IBOutlet weak var cashPaymentView: UIView!
    @IBOutlet weak var invoiceTableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var paymentTableviewHeight: NSLayoutConstraint!
      @IBOutlet weak var mainviewHeight: NSLayoutConstraint!
    var invoiceListdisplay :[NSDictionary]  =  [[:]]
    var paymentListdisplay :[NSDictionary]  =  [[:]]
    
    
    let myItems = [
        VoteModel(title: "Cash Payment", isSelected: false, isUserSelectEnable: true),
        VoteModel(title: "Cheque Payment", isSelected: false, isUserSelectEnable: true),
        VoteModel(title: "Draft Payment", isSelected: false, isUserSelectEnable: true),
        VoteModel(title: "Card Payment", isSelected: false, isUserSelectEnable: true),
         VoteModel(title: "Bank Transfer", isSelected: false, isUserSelectEnable: true),
        
        
        ]
  
    
    
    
    
    
    @IBOutlet weak var billedStatus: SkyFloatingLabelTextField!
    @IBOutlet weak var date: SkyFloatingLabelTextField!
    @IBOutlet weak var totalAmount: SkyFloatingLabelTextField!
    @IBOutlet weak var recievedAmount: SkyFloatingLabelTextField!
    @IBOutlet weak var paidAmount: SkyFloatingLabelTextField!
    @IBOutlet weak var balanceAmount: SkyFloatingLabelTextField!
    
  //subview
 
    @IBOutlet weak var invoiceNo: SkyFloatingLabelTextField!
    @IBOutlet weak var invoiceDate: SkyFloatingLabelTextField!
    @IBOutlet weak var totalAmt: SkyFloatingLabelTextField!
    
  //cashPaymentView
    
    @IBOutlet weak var cashAmount: SkyFloatingLabelTextField!
    
   //chequePaymentView
    
    @IBOutlet weak var payeeName: SkyFloatingLabelTextField!
    @IBOutlet weak var chequeNo: SkyFloatingLabelTextField!
    @IBOutlet weak var bankName: SkyFloatingLabelTextField!
    @IBOutlet weak var chequeAmount: SkyFloatingLabelTextField!
    @IBOutlet weak var chequeDate: SkyFloatingLabelTextField!
    @IBOutlet weak var accountNo: SkyFloatingLabelTextField!
    @IBOutlet weak var bankaddress: SkyFloatingLabelTextField!
    @IBOutlet weak var toWhichAccount: SkyFloatingLabelTextField!
    
    //draftPaymentView
    
    @IBOutlet weak var drafPayName: SkyFloatingLabelTextField!
    @IBOutlet weak var ddNo: SkyFloatingLabelTextField!
    @IBOutlet weak var draftAccNo: SkyFloatingLabelTextField!
    @IBOutlet weak var draftBankAddr: SkyFloatingLabelTextField!
    @IBOutlet weak var draftAmount: SkyFloatingLabelTextField!
    @IBOutlet weak var ddDate: SkyFloatingLabelTextField!
    @IBOutlet weak var draftBankName: SkyFloatingLabelTextField!
    @IBOutlet weak var draftToWhchAcc: SkyFloatingLabelTextField!
    
    //cardPayment
    
    @IBOutlet weak var cardAmount: SkyFloatingLabelTextField!
    @IBOutlet weak var referenceNo: SkyFloatingLabelTextField!
    @IBOutlet weak var remark: SkyFloatingLabelTextField!
    
    //bankTransferView
    
    @IBOutlet weak var bankPayName: SkyFloatingLabelTextField!
    @IBOutlet weak var bankToWhchAcc: SkyFloatingLabelTextField!
    @IBOutlet weak var fromWhchAcc: SkyFloatingLabelTextField!
    @IBOutlet weak var paymentMode: SkyFloatingLabelTextField!
    @IBOutlet weak var bankDate: SkyFloatingLabelTextField!
    @IBOutlet weak var bankAmount: SkyFloatingLabelTextField!
    
    let functionCall = GetRespone()
    
    @IBOutlet weak var invoiceTable: UITableView!
    @IBOutlet weak var paymentTable: UITableView!
    
    
    func serviceCalldata()  {
        
        functionCall.delegete = self
        functionCall.getserviceCall(param: ServiceCallRepresenation(), tpye: TransACNRBaseTestUrl+TransACNRGetFinanceDetailsOnPageLoad as NSString)
    }
    
    
    @IBAction func tapAddbtn(_ sender: UIButton)
    {
        
        if (subView.isHidden == false)
        {
            subView.isHidden = true
            mainView.isHidden = false
        }
            
        else
        {
            subView.isHidden = false
            mainView.isHidden = true
        }
 
        
    }
    
    @IBAction func cancelBtn(_ sender: UIButton)
    {
        if (subView.isHidden == true)
        {
            subView.isHidden = false
            mainView.isHidden = true
        }
            
        else
        {
            subView.isHidden = true
            mainView.isHidden = false
        }
        

    }
    func GetServiceRespone(param: NSDictionary) {
        
        var totalamount:Float32 =  0.0

            
            
            if let value = param["SavedInvoicedetails"] {
                invoiceListdisplay.removeAll()
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    let  new :Float32 =  obj.object(forKey: "Total_Amount") as! Float32
                    
                    totalamount  = totalamount + new
                    invoiceListdisplay.append(obj)
                    
                    
                }
                invoiceTableviewHeight.constant =       CGFloat(invoiceListdisplay.count  * 30)
                
                
                
                
                
            }
            if let value = param["PaymentModeHistory"] {
                paymentListdisplay.removeAll()
                for item in value as! Array<Any> {
                    
                    let obj = item as! NSDictionary
                    
                    
                    paymentListdisplay.append(obj)
                    
                    
                }
                paymentTableviewHeight.constant =       CGFloat(paymentListdisplay.count  * 30)
                
                
                
                
                
            }
            
            
            
            
            
            
            totalAmount.text = "\(totalamount)"
            
            
            
            
            
            
            if let value = param["PaidAmount"] {
                
                let value1 = value as? Float32 ?? 0.0
                
                let balance = totalamount - value1
                
                
                paidAmount.text = "\(value1)"
                
                
                balanceAmount.text = "\(balance)"
                
                
                
            }
            
            
            
            
            
            invoiceTable.reloadData()
            paymentTable.reloadData()
            
            
            
            
            mainviewHeight.constant = 700 + invoiceTableviewHeight.constant + paymentTableviewHeight.constant
            
    
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         if tableView == paymentTable {
            return paymentListdisplay.count
        }else{
            return invoiceListdisplay.count
        }
        
    }
    
    
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
        
        
        
        return 30.0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        var cell = FinaceFormTVCell()
        
        
        
        var model : NSDictionary
        
        
     if tableView == paymentTable {
            
            cell = paymentTable.dequeueReusableCell(withIdentifier: "FinaceFormPaymentID", for: indexPath ) as! FinaceFormTVCell
            
            model  = paymentListdisplay[indexPath.row]
            
            configurejobdisplayCellPasspay(cell: cell,forrowatindepath:indexPath as NSIndexPath, passingDict: model)
            
        }else{
            
            cell = invoiceTable.dequeueReusableCell(withIdentifier: "FinaceFormInvoiceID", for: indexPath ) as! FinaceFormTVCell
            
            model  = invoiceListdisplay[indexPath.row]
            
            configurejobdisplayCellPass(cell: cell,forrowatindepath:indexPath as NSIndexPath, passingDict: model)
        }
        
        
        
        return cell
        
        
        
    }
    
    
  
    
    func configurejobdisplayCellPass(cell:FinaceFormTVCell,forrowatindepath indexPath:NSIndexPath, passingDict model:NSDictionary){
        
        
        
        cell.spareHead.text = model.object(forKey: "Invoice_Number") as? String ?? ""
        
        let menu_Id : Float32 = model.object(forKey: "Total_Amount")as? Float32 ?? 0.0
        cell.spareCount.text = model.object(forKey: "Invoice_Date") as? String ?? ""
        
        cell.spareRem.text = "\(menu_Id)"
        
        
        
        
    }
    
    func configurejobdisplayCellPasspay(cell:FinaceFormTVCell,forrowatindepath indexPath:NSIndexPath, passingDict model:NSDictionary){
        
        
        
        cell.spareHead.text = model.object(forKey: "PaymentMode") as? String ?? ""
        
        let menu_Id : Float32 = model.object(forKey: "Payment_Details_Amount")as? Float32 ?? 0.0
        cell.spareCount.text = model.object(forKey: "Payment_Details_Date") as? String ?? ""
        
        cell.spareEdit.text = "\(menu_Id)"
        
        
        
        
    }
    
  
    
    
    
    
    
    
    
    @IBAction func backNavigation(_ sender: UIButton)
    {
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //chequePaymentView.isHidden = true
        
        
        amChoiceView.isRightToLeft = false // use it to support right to left language
        
        amChoiceView.delegate = self // the delegate used to get the selected item when pressed
        
        amChoiceView.data = myItems // fill your item , the item may come from server or static in your code like i have done
        
        amChoiceView.selectionType = .single // selection type , single or multiple
        
        amChoiceView.cellHeight = 40// to set cell hight
        
        amChoiceView.arrowImage = nil // use ot if you want to add arrow to the cell
     
        // you can set the selected and unselected image programmatically
        amChoiceView.selectedImage = UIImage(named: "selectedItem")
        amChoiceView.unselectedImage = UIImage(named: "unSelectedItem")
        
        cashPaymentView.isHidden = true
        chequePaymentView.isHidden = true
        bankTransferView.isHidden = true
        cardPayment.isHidden = true
        draftPaymentView.isHidden = true
        serviceCalldata()
        
        invoiceTableviewHeight.constant = 0
        paymentTableviewHeight.constant = 0
        mainviewHeight.constant = 700
        invoiceTable.tableFooterView = UIView(frame: .zero)
        paymentTable.tableFooterView = UIView(frame: .zero)
        
        
        
        
        
        
        
        
        
        
    }
    
    
    // get the selected item when pressed
    func didSelectRowAt(indexPath: IndexPath)
    {
       
        if(indexPath.row == 0)
       {
        cashPaymentView.isHidden = false
        chequePaymentView.isHidden = true
        bankTransferView.isHidden = true
        draftPaymentView.isHidden = true
        cardPayment.isHidden = true
        
        }
        
        else if(indexPath.row == 1)
       {
        cashPaymentView.isHidden = true
        chequePaymentView.isHidden = false
        bankTransferView.isHidden = true
        draftPaymentView.isHidden = true
        cardPayment.isHidden = true
        
       }
        
       else if(indexPath.row == 2)
       {
        cashPaymentView.isHidden = true
        chequePaymentView.isHidden = true
        bankTransferView.isHidden = true
        draftPaymentView.isHidden = false
        cardPayment.isHidden = true
       }
        
       else if(indexPath.row == 3)
       {
        cashPaymentView.isHidden = true
        cardPayment.isHidden = false
        chequePaymentView.isHidden = true
        bankTransferView.isHidden = true
        draftPaymentView.isHidden = true
       }
        
       else if(indexPath.row == 4)
       {
        cashPaymentView.isHidden = true
        chequePaymentView.isHidden = true
        bankTransferView.isHidden = false
        draftPaymentView.isHidden = true
        cardPayment.isHidden = true
        
        }


    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension FinanceFormDetailsVC{
    
    
    func ServiceCallRepresenation() -> [String : Any] {
        
        let parameters:[String : Any] = ["Service_Id":seguefromModel.Service_Id]
        return parameters as [String : Any]
        
    }
}
