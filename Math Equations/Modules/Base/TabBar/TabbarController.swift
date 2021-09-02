//
//  TabbarController.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 01/09/2021.
//

import UIKit

var TAB = TabBarController.shared

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var icon1 = UITabBarItem()
    var icon2 = UITabBarItem()
    
    struct Static {
        static var instance: TabBarController?
    }
    
    class var shared: TabBarController {
        if Static.instance == nil {
            Static.instance = TabBarController()
        }
        return Static.instance!
    }
    
    func dispose() {
        TabBarController.Static.instance = nil
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        tabBar.tintColor = .primary
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        delegate = self
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 2, height: 0)
        tabBar.layer.shadowOpacity = 0.5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
       
    private func setupView() {
        let item1 = HomeRouter.assembleModule()
        let item2 = SettingsRouter.assembleModule()

        icon1 = UITabBarItem(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        icon2 = UITabBarItem(title: "", image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings"))

        item1.tabBarItem = icon1
        item2.tabBarItem = icon2

        let controllers = [item1, item2]
        self.viewControllers = controllers
    }
}
