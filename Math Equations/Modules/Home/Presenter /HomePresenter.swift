//
//  HomePresenter.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

class HomePresenter: HomePresenterInterface {
    
    weak var view: HomeView?
    var router: HomeRouterInterface!
    var interactor: HomeInteractorInterface!
    
}

extension HomePresenter: HomeInteractorOutput {
        
}
