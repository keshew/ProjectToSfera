//
//  FeedViewController.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//

import UIKit



class FeedViewController: UIViewController {
    var presenter: FeedPresenterProtocol?
    var tableView = UITableView()
    var feed: FeedCoin? = FeedCoin(news: [News]()) {
        didSet {
            tableView.reloadData()
        }
    }
    
    func getInfoAboutFeed(feed: FeedCoin) {
        DispatchQueue.main.async {
            self.feed = feed
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        presenter?.checkInternetConnection(view: self,table: tableView)
        configureTableView()
        setupContent()
    }
    
    //MARK: - SETUP VIEW
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)
    }
    
    func setupContent() {
        navigationItem.title = "Новости"
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
