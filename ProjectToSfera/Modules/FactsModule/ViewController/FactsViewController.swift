//
//  FactsViewController.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//

import UIKit

protocol FactsViewProtocol: AnyObject {
    func configureTableView()
    func setupContent()
    var fact: [Facts]? { get }
    func getArray(facts: [Facts])
}

class FactsViewController: UIViewController, FactsViewProtocol {
    var fact: [Facts]?
    var presenter: FactsPresenterProtocol?
    var tableView = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupContent()
        presenter?.getInfoFromPlistFile()
        presenter?.getInfoFromArray()
        
    
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



    func setupContent() {
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
// MARK: - FactsViewProtocol
extension FactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fact!.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FactTableViewCell.identifier,for: indexPath) as? FactTableViewCell else { return UITableViewCell() }
        cell.title.text = fact![indexPath.row].title!
        cell.descriptison.text = fact![indexPath.row].fact!
        cell.imageOfCoin.image = UIImage(data: fact![indexPath.row].image!)
        return cell
    }


}
