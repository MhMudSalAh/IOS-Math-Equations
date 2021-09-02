//
//  UINavigationController+Extension.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

extension UINavigationController {
    
    func setup() {
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .primary
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        let font = UIFont.boldSystemFont(ofSize: UIDevice.isPhone ? 18 : 22)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font]
        navigationBar.isTranslucent = false
    }
}
