//
//  UITextField+Extension.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

extension UITextField {
    
    @IBInspectable var kLeftView: UIImage? {
        get {
            if let img = leftView?.subviews.first as? UIImageView {
                return img.image
            } else {
                return nil
            }
        }
        set {
            let width: CGFloat = 35
            let height: CGFloat = 20
            let y = (frame.height - height) / 2
            let view = UIView(frame: CGRect(x: 10, y: y, width: width, height: height))
            let iconImageView = UIImageView(image: newValue)
            iconImageView.frame = CGRect(x: 10, y: 0, width: width - 20, height: height)
            iconImageView.contentMode = .scaleAspectFit
            view.addSubview(iconImageView)
            leftView = view
            leftViewMode = .always
        }
    }
    
    @IBInspectable var kRightView: UIImage? {
        get {
            if let img = rightView?.subviews.first as? UIImageView {
                return img.image
            } else {
                return nil
            }
        }
        set {
            let width: CGFloat = 35
            let height: CGFloat = 20
            let y = (frame.height - height) / 2
            let view = UIView(frame: CGRect(x: 10, y: y, width: width, height: height))
            let iconImageView = UIImageView(image: newValue)
            iconImageView.frame = CGRect(x: 10, y: 0, width: width - 20, height: height)
            iconImageView.contentMode = .scaleAspectFit
            view.addSubview(iconImageView)
            rightView = view
            rightViewMode = .always
        }
    }
    
    func checkSecurity() {
        if isSecureTextEntry {
            let tempText = text
            text = nil
            insertText(tempText ?? "")
        }
    }
    
    func localize() {
        self.textAlignment = (LOCAL.getLanguage() == Language.EN.rawValue ? .left : .right)
    }
    
    func getWidth(text: String) -> CGFloat {
       let txtField = UITextField(frame: .zero)
       txtField.text = text
       txtField.sizeToFit()
       return txtField.frame.size.width
   }
}

class CustomSecureTextField: UITextField {
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        
        if !isSecureTextEntry { return true }
        
        if let currentText = text { insertText(currentText) }
        
        return true
    }
}
