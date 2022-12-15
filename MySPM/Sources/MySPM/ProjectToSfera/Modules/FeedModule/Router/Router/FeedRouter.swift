//
//  FeedRouter.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//
import UIKit

final class FeedRouter: FeedRouterProtocol {
    weak var viewController: FeedViewController?
    
    func openURL(feed: FeedCoin, indexPath: IndexPath) {
        guard let url =  URL(string: (feed.news![indexPath.row].link!)) else { return }
        UIApplication.shared.open(url)
    }
}
