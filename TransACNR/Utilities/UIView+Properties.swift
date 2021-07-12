//
//  UIView+Properties.swift
//  Azool
//
//  Created by DON PAUL PM on 15/05/17.
//  Copyright © 2017 donpaulpm. All rights reserved.
//

import UIKit
private var kAssociationKeyMaxLength: Int = 0
@IBDesignable extension UIView {
    
//    @IBInspectable  var cornerRadius: CGFloat {
//        
//       set {
//            layer.cornerRadius = newValue
//            layer.masksToBounds = newValue > 0
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
//  
//    
//   @IBInspectable  var borderColor: UIColor {
//    
//        set {
//            layer.borderColor = newValue.cgColor
//           
//        }
//        get {
//            if let color   =        layer.borderColor {
//               return  UIColor(cgColor: color)
//            }
//            return UIColor(cgColor: UIColor.white as! CGColor)
//        }
//    }
//    
//   @IBInspectable  var borderwidth: CGFloat {
//    
//        set {
//            layer.borderWidth = newValue
//            
//        }
//        get {
//            return layer.borderWidth
//        }
//    }
}

extension UIColor {
    static var TransMainBlue: UIColor {
        return UIColor(red:0.01, green:0.52, blue:0.88, alpha:1.00)
    }
}
extension UITextField {
    
    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    
    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
            prospectiveText.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        
        let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        let substring = prospectiveText[..<indexEndOfText]
        text = String(substring)
        
        selectedTextRange = selection
    }
}
