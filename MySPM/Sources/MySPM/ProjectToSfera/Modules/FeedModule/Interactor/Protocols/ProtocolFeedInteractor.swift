//
//  ProtocolFeedInteractor.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import Foundation

protocol FeedInteractorProtocol: AnyObject {
    var apiManager: APIManager { get }
    func getFeedInfoFromNetwork()
    func checkInternetConnection() -> Bool
}
