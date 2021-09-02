//
//  SettingsController.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

class SettingsController: BaseController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SettingsPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        navigationItem.title = localizedText("settings")
        initTableView()
    }
}

extension SettingsController: SettingsView {
    
    func showLanguageAlert() {
        let alert = UIAlertController(title: localizedText("change_language_message"), message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: localizedText("english"), style: .default) { action in
            self.presenter.switchToEnglishApp()
        })
        
        alert.addAction(UIAlertAction(title: localizedText("arabic"), style: .default) { action in
            self.presenter.switchToArabicApp()
        })
        
        alert.addAction(UIAlertAction(title: localizedText("cancel"), style: .cancel, handler: nil))
        
        if let popover = alert.popoverPresentationController {
          popover.sourceView = self.view
          popover.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
          popover.permittedArrowDirections = []
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}

