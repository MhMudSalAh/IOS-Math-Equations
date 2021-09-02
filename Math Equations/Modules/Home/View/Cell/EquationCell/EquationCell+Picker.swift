//
//  EquationCell+Picker.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 02/09/2021.
//

import UIKit

extension EquationCell: PickerViewControllerDelegate {

    func showOperationsPicker() {
        let value = lblOperation.text ?? ""
        let array = operations

        PICKER.delegate = self
        PICKER.show(vc: vc!, sender: viewOperation, array: array, index: selectedOperationIndex, value: value)
    }

    func showSecondsPicker() {
        let value = lblSeconds.text ?? ""
        let array = seconds

        PICKER.delegate = self
        PICKER.show(vc: vc!, sender: viewSeconds, array: array, index: selectedSecondsIndex, value: value)
    }

    func didSelect(sender: Any?, index: Int, value: String) {
        switch sender as! UIView {
        case viewOperation:
            selectedOperationIndex = index
            lblOperation.text = operations[selectedOperationIndex]
        case viewSeconds:
            selectedSecondsIndex = index
            lblSecondsValue.text = seconds[selectedSecondsIndex]
        default:
            break
        }
    }
}

extension EquationCell: UITextFieldDelegate {
    
}
