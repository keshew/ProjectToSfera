//
//  FactsViewController.swift
//
//  Created by Артём Коротков on 28.11.2022
//
import UIKit

final class FactsViewController: UIViewController, FactsViewProtocol {
    var presenter: FactsPresenterProtocol?
    var tableView = UITableView()
    var addItem: UIBarButtonItem?
    
    init(presenter: FactsPresenterProtocol?) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupView()
        presenter?.askToDateFromPlist()
        configureTabBarItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getFetch()
        tableView.reloadData()
    }
    
    func configureTableView() {
        tableView.allowsSelection = false
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
        navigationProfileEditVC.modalPresentationStyle = .fullScreen
        navigationProfileEditVC.modalTransitionStyle = .crossDissolve
        present(navigationProfileEditVC, animated: true)
        
    }
    
    func setupView() {
        //dymanic height(2)
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
