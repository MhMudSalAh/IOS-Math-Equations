//
//  SettingsPresenter.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

class SettingsPresenter: SettingsPresenterInterface {

    var view: SettingsView?
    var router: SettingsRouterInterface!
    var interactor: SettingsInteractorInterface!
    
    func switchToEnglishApp() {
        if LOCAL.getLanguage() == Language.AR.rawValue {
            LOCAL.setLocale(.EN, .forceLeftToRight)
            router.resetApp()
        }
    }
    
    func switchToArabicApp() {
        if LOCAL.getLanguage() == Language.EN.rawValue {
            LOCAL.setLocale(.AR, .forceRightToLeft)
            router.resetApp()
        }
    }
}

extension SettingsPresenter: SettingsIntercatorOutput {
    
}
