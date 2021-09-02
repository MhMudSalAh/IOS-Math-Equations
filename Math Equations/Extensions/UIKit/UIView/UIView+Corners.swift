//
//  UIView+Corners.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func conrnerRadiusRL(_ view: UIView){
        if LOCAL.getLanguage() == Language.EN.rawValue {
            view.roundCorners([.bottomLeft, .topLeft], radius: 4)
        } else if LOCAL.getLanguage() == Language.AR.rawValue {
            view.roundCorners([.bottomRight, .topRight], radius: 4)
        }
    }
    
    func conrnerRadiusDisCount(_ view: UIView, _ label: UILabel?){
        if LOCAL.getLanguage() == Language.EN.rawValue {
            view.roundCorners([.bottomRight], radius: 4)
            //label?.roundCorners([.topLeft, .bottomRight], radius: 10)
            
        } else if LOCAL.getLanguage() == Language.AR.rawValue {
            view.roundCorners([.bottomLeft], radius: 4)
            //label?.roundCorners([.topRight, .bottomLeft], radius: 10)
        }
    }
    
    func cornerRadiusTop(_ view: UIView, _ radius: CGFloat? = 4){
        view.roundCorners([.topRight, .topLeft], radius: radius!)
    }
    
    func conrnerRadiusView(_ view: UIView){
        if LOCAL.getLanguage() == Language.EN.rawValue {
            view.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        } else if LOCAL.getLanguage() == Language.AR.rawValue {
            view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        }
    }

    func conrnerRadiusTop(_ view: UIView, _ radius: CGFloat? = 4){
        view.layer.cornerRadius = radius!
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
}
