//
//  UIDevice+Extension.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

extension UIDevice {
    
    class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }

}
