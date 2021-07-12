//
//  Utilities.swift
//  BeautyClinic
//
//  Created by AJESHKUMAR CHEMPANKULAM DIVAKARAN on 10/06/17.
//  Copyright © 2017 donpaulpm. All rights reserved.
//

import Foundation
import UIKit


public class Utilities
{
    
    /*-----------------------------------------------------------------------*/
    
    // MARK: - Alert Colors
    
    
    class func alertBGColor() -> UInt{
        let color = 0xFFFFFF 
        return UInt(color)
    }
    
    class func alertColor() -> UInt{
        let color = 0xEE3744 
        return UInt(color)
    }
    
    class func BGColour() ->UIColor {
        let color = UIColor(red:228/255, green: 32/255, blue: 1/255, alpha: 1.0)
        return color
    }
    
    class func FGColour() ->UIColor {
        let color = UIColor(red:254/255, green: 245/255, blue: 246/255, alpha: 1)
        return color
    }
    
    class func FGRed() ->UIColor {
        let color = UIColor(red:213/255, green: 18/255, blue: 13/255, alpha: 1)
        return color
    }
    class func FGBlue() ->UIColor {
        let color = UIColor(red:34/255, green: 61/255, blue: 130/255, alpha: 1)
        return color
    }

     
    /*-----------------------------------------------------------------------*/
    
    
    // MARK: - Alert.
    
    class func AlertActionDone(Title:String,Message:String,ButtonText : String ,setView :UIView) {
        
        MTPopUp(frame: setView.frame).show(complete: { (index) in
            print("INDEX : \(index)")
        }, view: setView, animationType: MTAnimation.FadeIn_FadeOut, strMessage: Message, btnArray: [ButtonText])
   
        
    }
    class func shareSocial(shareStr: String,setView :UIView){
        
        if var mainController = UIApplication.shared.keyWindow?.rootViewController {
            
            while let presentedViewController = mainController.presentedViewController {
                
                mainController = presentedViewController
                
            }
            
            
            let textToShare = [ shareStr ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = setView
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToTwitter, UIActivityType.postToVimeo, UIActivityType.postToWeibo, UIActivityType.openInIBooks, UIActivityType.copyToPasteboard, UIActivityType.mail, UIActivityType.message, UIActivityType.saveToCameraRoll, UIActivityType.copyToPasteboard, UIActivityType.addToReadingList, UIActivityType.print ]
       
      
        
    }
    }
    
    /*-----------------------------------------------------------------------*/
    
    // MARK: - Mortion Effect
    
    class func mortioeffect(toView view:UIView, mag:Float) {
        let xMortion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMortion.minimumRelativeValue = -mag
        xMortion.maximumRelativeValue = mag
        
        let yMortion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMortion.minimumRelativeValue = -mag
        yMortion.maximumRelativeValue = mag
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMortion, yMortion]
        view.addMotionEffect(group)
    }
    
    /*-----------------------------------------------------------------------*/
    
    

}
