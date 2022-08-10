//
//  TabView.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/08.
//

import Foundation
import SnapKit

class TabBarController: UITabBarController{
    
    // navigation controller
    private lazy var homeTabController: UINavigationController = {
        let viewController = MainView()
        let tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house.fill"),
            tag: 0
        )
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    private lazy var focusTabView: UINavigationController = {
        let focusController = FocusView()
        let tabBarItem = UITabBarItem(
            title: "집중",
            image: UIImage(systemName:  "alarm.fill"),
            tag: 1
        )
        focusController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: focusController)
        return navigationView
    }()
    private lazy var categoryTabView: UINavigationController = {
        let categoryController = CategoryView()
        let tabBarItem = UITabBarItem(
        title: "분 석",
        image: UIImage(systemName: "doc.text.below.ecg"),//books.vertical
        tag: 2
        )
        categoryController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: categoryController)
        return navigationView
    }()
    private lazy var infoTabView: UINavigationController = {
        let infoController = InfoView()
        let tabBarItem = UITabBarItem(
        title: "정 보",
        image: UIImage(systemName: "leaf.arrow.triangle.circlepath"),
        tag: 3
        )
        infoController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: infoController)
        return navigationView
    }()
    
    override func viewDidLayoutSubviews(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeTabController, focusTabView, categoryTabView, infoTabView]
        self.configureTabBar()
    }
    
}
extension TabBarController {
    func configureTabBar() {
        self.tabBar.tintColor = .label
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.backgroundColor = UIColor.systemBackground.cgColor
        self.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        self.tabBar.layer.borderWidth = 0.4
    }
}
