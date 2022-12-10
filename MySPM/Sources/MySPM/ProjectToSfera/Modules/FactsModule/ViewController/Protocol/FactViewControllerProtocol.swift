//
//  FactViewControllerProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import UIKit
import CoreData
protocol FactsViewProtocol: AnyObject {
    var fact: [Facts]? { get }
    var tableView: UITableView { get }
    var addItem: UIBarButtonItem? { get }
    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> { get }
    func getArray(facts: [Facts])
    func configureTableView()
    func configureTabBarItem()
    func setupView()
    func addFacts()
}
