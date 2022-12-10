//
//  MarketViewController.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//

import UIKit

class MarketViewController: UIViewController {
    
    let tableView = UITableView()
    var presenter: MarketPresenterProtocol?
    var sortingItemBar: UIBarButtonItem?
    var coin: Coin = Coin(coins: [CoinElement]()) {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        configureTableView()
        setupContent()
    }
    
    func getInfoAboutCoins(coin: Coin) {
        DispatchQueue.main.async {
            self.coin = coin
        }
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
