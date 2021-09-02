//
//  Validator.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 02/09/2021.
//

import UIKit

let VALID = Validator.shared

struct ValidationRegEx {

    static let number = ".*[0-9]+.*"
}

class Validator: NSObject {
    
    static var shared = Validator()
    
    func isNumber(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.number)
    }
        
    func validate(_ text: String?, _ regEx: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", regEx)
        return test.evaluate(with: text)
    }
}
