//
//  ProtocolFeedInteractor.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import UIKit

protocol FeedInteractorProtocol: AnyObject {
    var networkAPIManager: APIManager? { get }
    func getFeedInfoFromNetwork()
    func checkInternetConnection(view: UIViewController, table: UITableView)
}
