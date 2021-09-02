//
//  Home+TableView.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

extension HomeController: UITableViewDelegate, UITableViewDataSource {

    func initTableView() {
        tableView.initialize(cellClass: EquationCell.self, delegate: self, dataSource: self)
        tableView.registerCellNib(cellClass: ResultCell.self)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refresh.isRefreshing && scrollView.contentOffset.y < 0 {

        } else {
            endRefresher()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + equations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeue(cellClass: EquationCell.self)
            cell.setupCell(self, self)
            return cell
        default:
            let cell = tableView.dequeue(cellClass: ResultCell.self)
            cell.setupCell(equations[indexPath.row - 1])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
}
