//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Александр on 02.02.2023.
//

import UIKit

//MARK: - TabBarController
final class MainTabBarViewController: UITabBarController {

    private var feedViewController = FeedViewController()
    private var logInViewController = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        tabBar.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    //MARK: - Creation VC
    private func generateTabBar() {
        viewControllers = [
            createNavController(vc: logInViewController, itemName: "logIn", itemImage: "personalhotspot"),
            createNavController(vc: feedViewController, itemName: "Feed", itemImage: "light.ribbon")
        ]
    }
    
    //MARK: - Settings NC
    private func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 5, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        return navController
    }
}
