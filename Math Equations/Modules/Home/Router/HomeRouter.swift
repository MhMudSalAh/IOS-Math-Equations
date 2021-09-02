//
//  HomeRouter.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

class HomeRouter: HomeRouterInterface {
    
    weak var viewController: UIViewController?
                
    static func assembleModule() -> UIViewController {
        let view: HomeController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeController") as! HomeController
            
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
            
        let navigation = NavController(rootViewController: view)
        navigation.setup()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return navigation
    }
}
