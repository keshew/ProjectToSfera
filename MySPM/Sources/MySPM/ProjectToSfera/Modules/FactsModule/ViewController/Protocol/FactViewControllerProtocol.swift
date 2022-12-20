//
//  FactViewControllerProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import UIKit

protocol FactsViewProtocol: AnyObject {
    var tableView: UITableView { get }
    var addItem: UIBarButtonItem? { get }
    func configureTableView()
    func configureTabBarItem()
    func setupView()
    func addFacts()
}
