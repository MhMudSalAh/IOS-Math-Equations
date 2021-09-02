//
//  SettingsRouter.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

class SettingsRouter: SettingsRouterInterface {

    var viewController: UIViewController?
            
    func resetApp() {
        RootRouter().resetApp()
    }
    
    static func assembleModule() -> UIViewController {
        let view: SettingsController = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "SettingsController") as! SettingsController
        
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor()
        let router = SettingsRouter()

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
