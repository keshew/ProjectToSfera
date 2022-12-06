//
//  ExtensionFeedPresenter.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import UIKit

extension FeedPresenter: FeedPresenterProtocol {
    func checkInternetConnection(view: UIViewController, table: UITableView) {
        if MonitoringNetworkManager.shared.isConnected == false {
            let alert = UIAlertController(title: "Проблемы с интернет подключением", message: "Пожалуйста проверьте поключение к интернету и попробуйте снова", preferredStyle: .alert)
            view.view.backgroundColor = .white
            view.present(alert, animated: true)
            print("ITS ALERT")
        }
    }
}
