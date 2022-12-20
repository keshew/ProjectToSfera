//
//  FeedPresenter.swift
//
//  Created by Артём Коротков on 28.11.2022
//
import Foundation

final class FeedPresenter {
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
    
    func askToOpenURL(indexPath: IndexPath) {
        guard let urlString = view?.feed?.news?[indexPath.row].link else { return }
        guard let url = URL(string: urlString) else { return }
        router.openURL(url: url)
    }

    func viewDidLoaded() {
        interactor.getFeedInfoFromNetwork()
    }
}
