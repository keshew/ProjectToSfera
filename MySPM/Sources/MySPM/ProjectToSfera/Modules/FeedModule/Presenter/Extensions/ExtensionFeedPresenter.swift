//
//  ExtensionFeedPresenter.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import UIKit

extension FeedPresenter: FeedPresenterProtocol {
    func askToCheckInternetConnection(view: UIViewController, table: UITableView) {
        interactor.checkInternetConnection(view: view, table: table)
        }
    }

