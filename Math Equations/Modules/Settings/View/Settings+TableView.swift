//
//  Settings+TableView.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

extension SettingsController: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        tableView.initialize(cellClass: SettingsBtnCell.self, delegate: self, dataSource: self, estimatedRowHeight: 60)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: SettingsBtnCell.self)
        cell.setupCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            showLanguageAlert()
        default:
            break
        }
    }
}
