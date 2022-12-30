//
//  MainTabBarController.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 28.11.2022.
//

import UIKit

final public class MainTabBarController: UITabBarController {
    
     public override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }

   private func generateTabBar() {
        setViewControllers([
            generateViewControllers(
                viewController: UINavigationController(rootViewController: FeedModuleBuilder.build()),
                title: "Новости",
                image: UIImage(named: "feeds", in: .module, compatibleWith: nil)
            ),
            generateViewControllers(viewController: UINavigationController(rootViewController: MarketModuleBuilder.build()),
                                    title: "Рынок",
                                    image: UIImage(named: "market", in: .module, compatibleWith: nil)
                                   ),
            generateViewControllers(
                viewController: UINavigationController(rootViewController: FactsModuleBuilder.build()) ,
                title: "Факты",
                image: UIImage(named: "facts", in: .module, compatibleWith: nil))
        ],animated: true)
    }
    
    private func generateViewControllers(viewController: UINavigationController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        tabBar.itemPositioning = .centered
        
        tabBar.tintColor = .mainBlueColor
        tabBar.unselectedItemTintColor = .unselectedItemTabBarColor
    }
}
