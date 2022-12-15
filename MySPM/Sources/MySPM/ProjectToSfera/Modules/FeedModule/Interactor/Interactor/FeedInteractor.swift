//
//  FeedInteractor.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//
import UIKit

final class FeedInteractor: FeedInteractorProtocol {
    var networkAPIManager: APIManager?
    weak var presenter: FeedPresenterProtocol?

    func getFeedInfoFromNetwork() {
        let networkAPIManager = APIManager()
        networkAPIManager.getFeedCoin(completion: { [weak self] feed in
            guard let self = self else { return }
            self.presenter?.didLoadInfoAboutFeed(feed: feed)
        })
    }
    
    func checkInternetConnection(view: UIViewController, table: UITableView) {
        if MonitoringNetworkManager.shared.isConnected == false {
            let alert = UIAlertController(title: "Проблемы с интернет подключением", message: "Пожалуйста проверьте поключение к интернету и попробуйте снова", preferredStyle: .alert)
            view.view.backgroundColor = .white
            view.present(alert, animated: true)
        }
    }
}
