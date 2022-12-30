//
//  FeedInteractor.swift
//
//  Created by Артём Коротков on 28.11.2022
//
import Foundation

final class FeedInteractor: FeedInteractorProtocol {
    
    weak var presenter: FeedPresenterProtocol?
    var apiManager = APIManager()

    func getFeedInfoFromNetwork() {
        apiManager.getFeedCoin(completion: { [weak self] feed in
            guard let self = self else { return }
            self.presenter?.didLoadInfoAboutFeed(feed: feed)
        })
    }
    
    func checkInternetConnection() -> Bool {
        return MonitoringNetworkManager.shared.checkConnection()
    }
}
