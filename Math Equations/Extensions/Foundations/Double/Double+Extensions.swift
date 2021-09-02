//
//  Double+Extensions.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 02/09/2021.
//

import Foundation

extension Double {
    
    func rounded(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

