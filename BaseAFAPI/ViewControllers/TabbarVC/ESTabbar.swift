//
//  ESTabber.swift
//  BaseAFAPI
//
//  Created by ManhLD on 11/12/20.
//

import Foundation
import UIKit
import ESTabBarController_swift

class CustomTabbar {
    
    static func mixtureStyle() -> ESTabBarController {
        
        let tabBarController = ESTabBarController()
        tabBarController.tabBar.backgroundColor =  .white
        let v1 = HomeVC()
        let v2 = EventsVC()
        v1.tabBarItem = ESTabBarItem.init(ExampleBasicContentView(), title: "News", image: UIImage(named: "icon-home"), selectedImage: UIImage(named: "icon-home"))
        v2.tabBarItem = ESTabBarItem.init(ExampleBasicContentView(), title: "Events", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        tabBarController.viewControllers = [v1, v2]
        return tabBarController
    }
    
}
