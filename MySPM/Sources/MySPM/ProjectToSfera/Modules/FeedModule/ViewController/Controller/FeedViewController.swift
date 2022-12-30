//
//  FeedViewController.swift
//
//  Created by Артём Коротков on 28.11.2022
//

import UIKit

final class FeedViewController: UIViewController, FeedViewProtocol {
    
    var viewModel: ProtocolFeedViewModel?
    var presenter: FeedPresenterProtocol?
    var tableView = UITableView()
    
    init(presenter: FeedPresenterProtocol?) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        presenter?.askToCheckInternetConnection()
        configureTableView()
        setupContent()
    }
    
    func showAlert() {
       let alert = UIAlertController(title: "Проблемы с интернет подключением",
                                     message: "Пожалуйста проверьте поключение к интернету и попробуйте снова",
                                     preferredStyle: .alert)
       present(alert, animated: true)
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
