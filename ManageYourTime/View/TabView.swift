//
//  TabView.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/08.
//

import Foundation
import SnapKit

class TabView: UITabBarController{
    
    // navigation controller
    private let homeViewController: UINavigationController = {
        let viewController = Mainview()
        let tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house.fill"),
            tag: 0
        )
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeViewController]
    }
}
