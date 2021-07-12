
//
//  GetRespone.swift
//  Azool
//
//  Created by AJESHKUMAR CHEMPANKULAM DIVAKARAN on 17/05/17.
//  Copyright © 2017 donpaulpm. All rights reserved.
//

import UIKit
import Alamofire



protocol GetResultResponse
{
    
    func GetServiceRespone(param:NSDictionary)
    
}
class GetRespone: NSObject {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var delegete:GetResultResponse?
    var shared = SharedInstance.sharedData
  
    
    func getserviceCall(param:[String : Any],tpye:NSString) {
        
          print(tpye )
          print(param )
        if var mainController = UIApplication.shared.keyWindow?.rootViewController {
            
            while let presentedViewController = mainController.presentedViewController {
                
                mainController = presentedViewController
                
            }
            if isInternetAvailable(){
                let xAxis = mainController.view.center.x
                let yAxis = mainController.view.center.y
                
                let frame = CGRect(x: (xAxis - 60), y: (yAxis - 60), width: 120, height:120)
              
                let myView = UIView(frame: frame)
         
                
                
                myView.backgroundColor = .white
                myView.layer.cornerRadius = 10
                myView.clipsToBounds = true
              
            
                let imageView = UIImageView()
                let animationArray = [#imageLiteral(resourceName: "output-0"),#imageLiteral(resourceName: "output-1"),#imageLiteral(resourceName: "output-2"),#imageLiteral(resourceName: "output-3"),#imageLiteral(resourceName: "output-4"),#imageLiteral(resourceName: "output-5"),#imageLiteral(resourceName: "output-6"),#imageLiteral(resourceName: "output-7"),#imageLiteral(resourceName: "output-8"),#imageLiteral(resourceName: "output-9"),#imageLiteral(resourceName: "output-10"),#imageLiteral(resourceName: "output-11"),#imageLiteral(resourceName: "output-12"),#imageLiteral(resourceName: "output-13"),#imageLiteral(resourceName: "output-14"),#imageLiteral(resourceName: "output-15"),#imageLiteral(resourceName: "output-16"),#imageLiteral(resourceName: "output-17"),#imageLiteral(resourceName: "output-18"),#imageLiteral(resourceName: "output-19"),#imageLiteral(resourceName: "output-20"),#imageLiteral(resourceName: "output-21"),#imageLiteral(resourceName: "output-22"),#imageLiteral(resourceName: "output-23"),#imageLiteral(resourceName: "output-24"),#imageLiteral(resourceName: "output-25"),#imageLiteral(resourceName: "output-26"),#imageLiteral(resourceName: "output-27"),#imageLiteral(resourceName: "output-28"),#imageLiteral(resourceName: "output-29"),#imageLiteral(resourceName: "output-30"),#imageLiteral(resourceName: "output-31"),#imageLiteral(resourceName: "output-32"),#imageLiteral(resourceName: "output-33")]
                
               
                
                
                
                imageView.frame = CGRect(x: (xAxis - 50), y: (yAxis - 50), width: 100, height: 100)
                

                
               
                let testView1: UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height:  screenSize.height))
                testView1.backgroundColor = .clear
                let testView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height:  screenSize.height))
                
                
                
                testView.backgroundColor = .black
                testView.alpha = 0.3
                mainController.view.addSubview(testView1)
                
                testView1.addSubview(testView)
                testView1.addSubview(myView)
                testView1.addSubview(imageView)
           let animationView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height))
                        animationView.backgroundColor = UIColor.white
                        animationView.animationImages = animationArray
                        animationView.animationDuration = 1.5
                        animationView.animationRepeatCount = 0
                        animationView.startAnimating()
                        imageView.addSubview(animationView)
                
                
                imageView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
                
                
                UIView.animate(withDuration: 2.0,
                               delay: 0,
                               usingSpringWithDamping: 0.2,
                               initialSpringVelocity: 6.0,
                               options: .allowUserInteraction,
                               animations: { [weak self] in
                            imageView.transform = .identity
                               
                    },
                               completion: nil)
                
                
                let ulr =  NSURL(string:tpye as String)


            Alamofire.request(ulr! as URL, method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil)
                    .responseJSON { (response:DataResponse<Any>) in
                        switch(response.result) {
                            
                            
                                                case .success(_):
                            
                                                     testView1.removeFromSuperview()
                                                      if let data = response.result.value{
                                                      print(data)
                                                        let json = data as! NSDictionary
                                                        if((json.value(forKey: "Output")) != nil){
                                                            let status = json.value(forKey: "Output") as! NSString
                                                            if (status .isEqual(to: "Success")){
                            
                                                                self.delegete?.GetServiceRespone(param: json)
                            
                                                            }else{
                            
                            
                            
                                                                Utilities.AlertActionDone(Title: "", Message: json.value(forKey: "Output") as? String ?? TARErrorFound, ButtonText: TARDone,setView:mainController.view )
                            
                                                            }
                                                        }
                            
                                                    }
                                                    break
                                                case .failure(_):
                            
                                                   testView1.removeFromSuperview()
                                                    Utilities.AlertActionDone(Title: "", Message: response.result.error as? String ?? TARErrorFound, ButtonText: TARDone,setView:mainController.view )
                            
                                                    break
                            
                            
                                                }
                        
                                            }
                }
                
        
                
            else{
                
                
                 Utilities.AlertActionDone(Title: "", Message: TARNOInternet, ButtonText: TARDone,setView:mainController.view )
                
                
            }
            
        }
        
    }
  






}


