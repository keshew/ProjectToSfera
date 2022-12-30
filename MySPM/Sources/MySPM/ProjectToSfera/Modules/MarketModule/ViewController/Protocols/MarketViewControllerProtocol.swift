//
//  MarketViewControllerProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 01.12.2022.
//

import UIKit

protocol MarketViewControllerProtocol: AnyObject {
    var tableView: UITableView { get }
    var viewModel: ProtocolCoinViewModel? { get set }
    func configureTableView()
    func setupContent()
}
