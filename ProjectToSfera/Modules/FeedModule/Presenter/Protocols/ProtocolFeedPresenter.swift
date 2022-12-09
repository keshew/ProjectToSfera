//
//  ProtocolFeedPresenter.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import UIKit

protocol FeedPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoadInfoAboutFeed(feed: FeedCoin)
    func askToOpenURL(feed: FeedCoin, indexPath: IndexPath)
    func askToCheckInternetConnection(view: UIViewController, table: UITableView)
}
