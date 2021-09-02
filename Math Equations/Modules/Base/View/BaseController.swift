//
//  BaseController.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

class BaseController: UIViewController {
    
    var refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh.tintColor = .primary
        setupNavigation()
    }
}
