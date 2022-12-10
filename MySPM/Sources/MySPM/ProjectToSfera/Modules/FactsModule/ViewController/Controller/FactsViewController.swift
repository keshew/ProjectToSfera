//
//  FactsViewController.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//

import UIKit
import CoreData

class FactsViewController: UIViewController, FactsViewProtocol {
    var fact: [Facts]?
    var presenter: FactsPresenterProtocol?
    var tableView = UITableView()
    var addItem: UIBarButtonItem?
    
    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Facts")
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let fetchResult = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                     managedObjectContext: CoreDataManager.shared.context,
                                                     sectionNameKeyPath: nil, cacheName: nil)
        return fetchResult
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupView()
        presenter?.getInfoFromPlistFile()
        presenter?.getInfoFromArray()
        configureTabBarItem()
        presenter?.getFetch(fetchResultController: fetchResultController)
        fetchResultController.delegate = self
    }
    
    //MARK: - FUNCTIONS
    
    func getArray(facts: [Facts]) {
        fact = facts
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FactTableViewCell.self, forCellReuseIdentifier: FactTableViewCell.identifier)
    }
    
    func configureTabBarItem() {
        addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFacts))
        navigationItem.rightBarButtonItem = addItem
    }
    
    
    @objc func addFacts() {
        let navigationProfileEditVC = UINavigationController(rootViewController: AddingFactsModuleBuilder.build())
        present(navigationProfileEditVC, animated: true)
    }
    
    func setupView() {
        //dymanic height
        tableView.estimatedRowHeight = 450
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.separatorStyle = .none
        
        navigationItem.title = "Факты"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])
    }
}
