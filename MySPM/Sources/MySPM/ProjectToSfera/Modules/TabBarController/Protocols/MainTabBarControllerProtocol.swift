//
//  MainTabBarControllerProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 01.12.2022.
//

import UIKit

protocol MainTabBarControllerProtocol {
    func generateTabBar()
    func generateViewControllers(viewController: UINavigationController, title: String, image: UIImage?) -> UIViewController
    func setTabBarAppearance()
}
