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
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2 )
        
        //        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainTabBarColor.cgColor
        
        tabBar.tintColor = .mainBlueColor
        tabBar.unselectedItemTintColor = .unselectedItemTabBarColor
        
        //delete размытие
        //        tabBar.backgroundImage = UIImage()
        //        tabBar.backgroundColor = .clear
        //        tabBar.shadowImage = UIImage()
    }
}
