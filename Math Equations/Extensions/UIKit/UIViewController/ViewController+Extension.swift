//
//  ViewController+Extension.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

extension UIViewController {
    
    public func addChild(viewController: UIViewController, toView: UIView? = nil) {
        let view: UIView = toView ?? self.view
        self.addChild(viewController)
        viewController.willMove(toParent: self)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    public func removeFromParentViewController() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }

    public func hideTextFieldError(_ textField: UITextField, _ label: UILabel) {
        label.isHidden = false
        textField.bottomBorder = .bottomGrayLine
        label.isHidden = true
    }
    
    public func hideTextFieldPasswordError(_ view: UIView, _ label: UILabel) {
        view.addBottomBorderWithColor(color: UIColor.bottomGrayLine, width: 1)
        label.isHidden = false
        label.isHidden = true
    }
    
    public func showTextFieldError(_ textField: UITextField, _ label: UILabel) {
        textField.bottomBorder = .red
        label.isHidden = false
        label.textColor = .red
    }
    
    public func showTextFieldPasswordError(_ view: UIView, _ label: UILabel) {
        view.addBottomBorderWithColor(color: UIColor.red, width: 1)
        label.isHidden = false
        label.textColor = .red
    }
    
    public func showTextFieldSuccess(_ textField: UITextField, _ label: UILabel) {
        textField.bottomBorder = .bottomGrayLine
        label.isHidden = false
        label.text = LOCAL.localizedString(key: "looks_great")
        label.textColor = UIColor.successColor
    }
    
    public func showTextFieldPlaceholder(_ textField: UITextField, _ label: UILabel) {
        label.isHidden = false
        textField.placeholder = ""
    }
    
    public func hideTextFieldPlaceholder(_ textField: UITextField, _ label: UILabel, _ placeholder: String) {
        label.isHidden = true
        textField.placeholder = placeholder
    }
        
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(title: String, message: String) {
      let alertController = UIAlertController(title: title, message:
        message, preferredStyle: .alert)
      alertController.addAction(UIAlertAction(title: localizedText("ok"), style: .default, handler: {action in
      }))
      self.present(alertController, animated: true, completion: nil)
    }
}

