//
//  FeedRouter.swift
//
//  Created by Артём Коротков on 28.11.2022
//
import UIKit

final class FeedRouter: FeedRouterProtocol {
    
    weak var viewController: FeedViewController?
    
    func openURL(url: URL) {
        UIApplication.shared.open(url)
    }
}
