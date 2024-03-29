//
//  String+Extensions.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 02/09/2021.
//

import Foundation

extension String {
    
    func safelyLimitedTo(length n: Int)->String {
        if (self.count <= n) {
            return self
        }
        return String(Array(self).prefix(upTo: n))
    }
}
