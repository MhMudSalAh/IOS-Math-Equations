//
//  UIView+AnimateBackgroundColor.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import Foundation
import UIKit

public extension UIView {
    
    func animateBackgroundColor(color: UIColor, duration: Double = 0.5) {
        let originalColor = self.backgroundColor?.copy() as? UIColor ?? UIColor.clear
        
        UIView.animate(withDuration: duration) {
            self.backgroundColor = color
            UIView.animate(withDuration: duration) {
                self.backgroundColor = originalColor
            }
        }
    }
}
