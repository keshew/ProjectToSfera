//
//  MarketViewControllerProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 01.12.2022.
//

import UIKit

protocol MarketViewControllerProtocol: AnyObject {
    var sortingItemBar: UIBarButtonItem? { get }
    var tableView: UITableView { get }
    
    var coin: Coin { get }
    
    func configureTableView()
    func setupContent()
    func getInfoAboutCoins(coin: Coin)
}
