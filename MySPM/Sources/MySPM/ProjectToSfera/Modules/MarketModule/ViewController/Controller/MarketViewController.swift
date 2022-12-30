//
//  MarketViewController.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//

import UIKit

final class MarketViewController: UIViewController, MarketViewControllerProtocol {
    
    var viewModel: ProtocolCoinViewModel?
    var presenter: MarketPresenterProtocol?
    let tableView = UITableView()
    
    init(presenter: MarketPresenterProtocol?) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        configureTableView()
        setupContent()
    }
    
    //MARK: - SETUP VIEW
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MarketTableViewCell.self, forCellReuseIdentifier: MarketTableViewCell.identifier)
    }
    
    func setupContent() {
        navigationItem.title = "Рынок"
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
