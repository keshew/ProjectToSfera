//
//  ExtensionFeedPresenter.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import Foundation

extension FeedPresenter: FeedPresenterProtocol {
    
    func askToCheckInternetConnection() {
        if interactor.checkInternetConnection() == false {
            view?.showAlert()
        }
    }
}
