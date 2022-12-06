//
//  ExtensionMarketViewController.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 01.12.2022.
//

import UIKit

extension MarketViewController: MarketViewControllerProtocol, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let feed = coin.coins?.count {
            return feed
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.identifier, for: indexPath) as? MarketTableViewCell else { return UITableViewCell() }
        guard let path = self.coin.coins?[indexPath.row] else { return UITableViewCell() }
        cell.configureCell( // proverky sdelatь в методе тейбл вью селл
            coinIcon: path.icon,
            coinName: path.symbol,
            coinPrice: String(describing: path.price!),
            coinPositionInTable: String(describing: indexPath.row + 1),
            coinPriceInDay: String("\((path.priceChange1D!))\("%")")
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    //MARK: - Animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0, y: 1)
        UIView.animate(withDuration: 0.5) {
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}