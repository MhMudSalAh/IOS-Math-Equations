//
//  EquationCell.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 02/09/2021.
//

import UIKit

class EquationCell: UITableViewCell {

    @IBOutlet weak var txtFldFirstNu: UITextField!
    @IBOutlet weak var viewOperation: UIView!
    @IBOutlet weak var lblOperation: UILabel!
    @IBOutlet weak var txtFldSecondNu: UITextField!
    @IBOutlet weak var lblChooseTime: UILabel!
    @IBOutlet weak var viewSeconds: UIView!
    @IBOutlet weak var lblSecondsValue: UILabel!
    @IBOutlet weak var lblSeconds: UILabel!
    @IBOutlet weak var btnCalculate: LoadingButton!
    
    var vc: UIViewController? = nil
    var delegate: EquationDelegate?
    var selectedOperationIndex: Int = 0
    var selectedSecondsIndex: Int = 0
    var operations = ["+", "-", "*", "/"]
    var seconds = ["5", "10", "15"]
    
    func setupCell(_ vc: UIViewController, _ delegate: EquationDelegate?) {
        self.vc = vc
        self.delegate = delegate
        lblOperation.text = operations[selectedOperationIndex]
        lblSecondsValue.text = seconds[selectedSecondsIndex]
    }
    
    func setupTextFields () {
        txtFldFirstNu.delegate = self
        txtFldFirstNu.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        txtFldSecondNu.delegate = self
        txtFldSecondNu.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    }
    
    @objc func handleTextInputChange() {
        if isValid(txtFldFirstNu.text, txtFldSecondNu.text) {
            btnCalculate.isEnabled = true
            btnCalculate.alpha = 1.0
        } else {
            btnCalculate.isEnabled = false
            btnCalculate.alpha = 0.5
        }
    }
    
    func setupButton() {
        btnCalculate.btnDefault(cornerRadius: btnCalculate.frame.height/2, titleKey: localizedText("result"))
        btnCalculate.isEnabled = false
        btnCalculate.alpha = 0.5
    }
    
    func setupLabels() {
        lblChooseTime.text = localizedText("choose_delay_time")
        lblSeconds.text = localizedText("seconds")
        if UIDevice.isPad {
            if LOCAL.getLanguage() == Language.EN.rawValue {
                lblChooseTime.textAlignment = .right
                lblSeconds.textAlignment = .left
            } else {
                lblChooseTime.textAlignment = .left
                lblSeconds.textAlignment = .right
            }
        }
    }
    
    func setupViewOperations() {
        let tapOperation = UITapGestureRecognizer(target: self, action: #selector(self.viewOperationTap(_:)))
        tapOperation.numberOfTapsRequired = 1
        viewOperation.addGestureRecognizer(tapOperation)
        viewOperation.isUserInteractionEnabled = true
    }
    
    func setupViewSeconds() {
        let tapSeconds = UITapGestureRecognizer(target: self, action: #selector(self.viewSecondsTap(_:)))
        tapSeconds.numberOfTapsRequired = 1
        viewSeconds.addGestureRecognizer(tapSeconds)
        viewSeconds.isUserInteractionEnabled = true
    }

    
    @objc func viewOperationTap(_ sender: UITapGestureRecognizer) {
        showOperationsPicker()
    }
    
    @objc func viewSecondsTap(_ sender: UITapGestureRecognizer) {
        showSecondsPicker()
    }

    func isValid(_ firstNumber: String?, _ secondNumber: String?) -> Bool {
        if firstNumber?.isEmpty ?? true {
            return false
        } else if !VALID.isNumber(firstNumber) {
            return false
        } else if secondNumber?.isEmpty ?? true {
            return false
        } else if !VALID.isNumber(secondNumber) {
            return false
        }
        return true
    }

    @IBAction func actionCalculate(_ sender: Any) {
        vc?.view.endEditing(false)
        btnCalculate.showLoading()
        guard let time = Double(seconds[selectedSecondsIndex]) else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + time) { [self] in
            delegate?.didClickResult(getEquation())
            btnCalculate.hideLoading()
        }
    }
    
    func getEquation() -> Equation {
        guard let first = Double(txtFldFirstNu.text!) else {return Equation()}
        guard let second = Double(txtFldSecondNu.text!) else {return Equation()}
        var result: Double = 0
        switch operations[selectedOperationIndex] {
        case "+":
            result = first + second
        case "-":
            result = first - second
        case "*":
            result = first * second
        case "/":
            result = first / second
        default:
            break
        }
        return Equation(firstNumber: first, secondNumber: second, operation: operations[selectedOperationIndex], result: result)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTextFields()
        setupLabels()
        setupButton()
        setupViewOperations()
        setupViewSeconds()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}


