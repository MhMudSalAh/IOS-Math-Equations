//
//  PickerController.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

let PICKER = PickerController.shared

@objc protocol PickerViewControllerDelegate {
    @objc optional func didSelect(sender: Any?, index: Int, value: String)
    @objc optional func didSelectDate(sender: Any?, date: Date)
    @objc optional func didCancel(sender: Any?)
}

class PickerController: BaseController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    static var shared = PickerController()
    var currentVC: UIViewController!
    var dataArray: [String] = []
    var isDate = false
    var selectedIndex = -1
    var selectedValue = ""
    var datePickerMode = UIDatePicker.Mode.dateAndTime
    var minimumDate: Date?
    var maximumDate: Date?
    var currentDate = Date()
    var sender: Any?
    var delegate: PickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnConfirm.setTitle(localizedText("confirm"), for: .normal)
        btnCancel.setTitle(localizedText("cancel"), for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        datePicker.isHidden = !isDate
        picker.isHidden = isDate
        
        datePicker.datePickerMode = datePickerMode
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate
        datePicker.date = currentDate
        
        picker.reloadAllComponents()
        
        if selectedIndex >= 0 {
            picker.selectRow(selectedIndex, inComponent: 0, animated: false)
        }
        
        self.backgroundImage.alpha = 0.0
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundImage.alpha = 1.0
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        cancelAction(nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (dataArray.count > 0) {
            selectedIndex = row
        }
    }
        
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.black
        pickerLabel.text = dataArray[row]
        pickerLabel.font = UIFont.boldSystemFont(ofSize: UIDevice.isPhone ? 20 : 25)
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
    
    func show(vc: UIViewController, sender: Any?, array: [String], index: Int, value: String) {
        OperationQueue.main.addOperation {
            self.currentVC = vc
            self.modalPresentationStyle = .overFullScreen
            self.currentVC.view.endEditing(true)
            self.currentVC.present(self, animated: true, completion: nil)
            
            self.isDate = false
            self.sender = sender
            self.dataArray = array
            self.selectedIndex = index
            self.selectedValue = value
            if (self.dataArray.count > 0) {
                if self.selectedIndex < 0 || self.selectedIndex >= self.dataArray.count {
                    self.selectedIndex = 0
                }
            }
        }
    }
    
    func showDate(vc: UIViewController, sender: Any?, mode: UIDatePicker.Mode, minimum: Date?, maximum: Date?, current: Date) {
        OperationQueue.main.addOperation {
            self.currentVC = vc
            self.modalPresentationStyle = .overFullScreen
            self.currentVC.view.endEditing(true)
            self.currentVC.present(self, animated: true, completion: nil)
            
            self.isDate = true
            self.sender = sender
            self.dataArray = []
            self.selectedIndex = -1
            self.selectedValue = ""
            self.datePickerMode = mode
            self.minimumDate = minimum
            self.maximumDate = maximum
            self.currentDate = current
        }
    }
    
    @IBAction func cancelAction(_ sender: Any?) {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundImage.alpha = 0.0
        })
        dismiss(animated: true, completion: {
            self.delegate?.didCancel?(sender: self.sender)
        })
    }
    
    @IBAction func dismissPicker(_ sender: Any?) {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundImage.alpha = 0.0
        })
        dismiss(animated: true, completion: {
            if self.isDate {
                if self.delegate != nil && self.delegate!.didSelectDate != nil {
                    self.delegate!.didSelectDate!(sender: self.sender, date: self.datePicker.date)
                }
            } else {
                if self.delegate != nil && self.delegate!.didSelect != nil && self.selectedIndex >= 0 {
                    self.selectedValue = self.dataArray[self.selectedIndex]
                    self.delegate!.didSelect!(sender: self.sender, index: self.selectedIndex, value: self.selectedValue)
                }
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
