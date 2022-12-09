//
//  MainTabBarController.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 28.11.2022.
//

import UIKit

class MainTabBarController: UITabBarController, MainTabBarControllerProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }

    func generateTabBar() {
        setViewControllers([
            generateViewControllers(
                viewController: UINavigationController(rootViewController: FeedModuleBuilder.build()),
                title: "Новости",
                image: UIImage(named: "feeds")
            ),
            generateViewControllers(viewController: UINavigationController(rootViewController: MarketModuleBuilder.build()),
                                    title: "Рынок",
                                    image: UIImage(named: "market")
                                   ),
            generateViewControllers(
                viewController: UINavigationController(rootViewController: FactsModuleBuilder.build()) ,
                title: "Факты",
                image: UIImage(named: "facts"))
        ],animated: true)
    }
    
    func generateViewControllers(viewController: UINavigationController, title: String, image: UIImage?) -> UIViewController { 
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    func setTabBarAppearance() {
        tabBar.itemPositioning = .centered
        
        tabBar.tintColor = .mainBlueColor
        tabBar.unselectedItemTintColor = .unselectedItemTabBarColor
    }
}
