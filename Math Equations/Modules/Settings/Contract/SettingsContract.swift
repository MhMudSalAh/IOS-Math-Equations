//
//  SettingsContract.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

protocol SettingsView: AnyObject {
    var presenter: SettingsPresenterInterface! { get set }
    
    func showLanguageAlert()
}

protocol SettingsPresenterInterface: AnyObject {
    var view: SettingsView? { get set }
    var router: SettingsRouterInterface! { get set }
    var interactor: SettingsInteractorInterface! { get set }
    
    func switchToEnglishApp()
    func switchToArabicApp()
}

protocol SettingsInteractorInterface: AnyObject {
    var output: SettingsIntercatorOutput? { get set }
    
}

protocol SettingsIntercatorOutput: AnyObject {
    
}

protocol SettingsRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
         
    func resetApp()
    static func assembleModule() -> UIViewController
}
