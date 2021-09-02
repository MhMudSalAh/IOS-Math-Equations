//
//  HomeContract.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

protocol HomeView: AnyObject {
    var presenter: HomePresenterInterface! { get set }

}

protocol HomePresenterInterface: AnyObject {
    var view: HomeView? { get set }
    var router: HomeRouterInterface! { get set }
    var interactor: HomeInteractorInterface! { get set }
        
}

protocol HomeInteractorInterface: AnyObject {
    var output: HomeInteractorOutput! { get set }
    
}

protocol HomeInteractorOutput: AnyObject {
    
}

protocol HomeRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
        
    static func assembleModule() -> UIViewController
}
