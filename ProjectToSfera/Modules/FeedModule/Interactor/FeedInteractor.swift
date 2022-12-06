//
//  FeedInteractor.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//
import UIKit

class FeedInteractor: FeedInteractorProtocol {
    var networkAPIManager: APIManager?
    weak var presenter: FeedPresenterProtocol?

    func getFeedInfoFromNetwork() {
        let networkAPIManager = APIManager()
        networkAPIManager.getFeedCoin(completion: { [weak self] feed in
            guard let self = self else { return }
            self.presenter?.didLoadInfoAboutFeed(feed: feed)
        })
    }
}
