//
//  ProtocolFeedViewController.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import UIKit

protocol FeedViewProtocol: AnyObject {
    var tableView: UITableView { get }
    var viewModel: ProtocolFeedViewModel? { get set }
    func showAlert()
    func configureTableView()
    func setupContent()
}
