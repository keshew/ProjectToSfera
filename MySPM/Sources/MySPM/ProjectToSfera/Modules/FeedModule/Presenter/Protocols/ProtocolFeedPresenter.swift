//
//  ProtocolFeedPresenter.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import Foundation

protocol FeedPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoadInfoAboutFeed(feed: FeedCoin)
    func askToOpenURL(indexPath: IndexPath)
    func askToCheckInternetConnection()
}
