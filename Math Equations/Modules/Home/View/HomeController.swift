//
//  HomeController.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

class HomeController: BaseController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenterInterface!
    
    var equations: [Equation] = [] {
        didSet {
            reloadTableView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        navigationItem.title = localizedText("home")
        initTableView()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
}

extension HomeController: HomeView {
    
}

extension HomeController: EquationDelegate {
    func didClickResult(_ equation: Equation) {
        equations.append(equation)
    }
}
