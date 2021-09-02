//
//  Base+Refresh.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

// MARK:- TableView Refresher

extension BaseController {
    
    func addRefresher(_ tableView: UITableView, _ color: UIColor? = .primary) {
        tableView.refreshControl = refresh
        refresh.tintColor = color
        self.refresh.beginRefreshing()
    }
    
    func endRefresher() {
        if refresh.isRefreshing {
            UIView.animate(withDuration: 0.5) {
                self.refresh.endRefreshing()
            }
        }
    }    
}

