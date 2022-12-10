//
//  FeedPresenter.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//
import UIKit

class FeedPresenter {
    weak var view: FeedViewProtocol?
    var router: FeedRouterProtocol
    var interactor: FeedInteractorProtocol

    init(interactor: FeedInteractorProtocol, router: FeedRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func didLoadInfoAboutFeed(feed: FeedCoin) {
        view?.getInfoAboutFeed(feed: feed)
    }
    
    func askToOpenURL(feed: FeedCoin, indexPath: IndexPath) {
        router.openURL(feed: feed, indexPath: indexPath)
    }

    func viewDidLoaded() {
        interactor.getFeedInfoFromNetwork()
    }
}
