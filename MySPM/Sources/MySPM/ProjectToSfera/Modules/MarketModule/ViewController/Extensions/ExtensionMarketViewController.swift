//
//  ExtensionMarketViewController.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 01.12.2022.
//

import UIKit

//MARK: - DataSourse
extension MarketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.identifier, for: indexPath) as? MarketTableViewCell else { return UITableViewCell() }
        guard let coin = viewModel?.coin.coins?[indexPath.row] else { return UITableViewCell() }
        guard let priceDay = coin.priceChange1D else { return UITableViewCell() }
        guard let price = coin.price else { return UITableViewCell() }
        cell.configureCell(
            coinIcon: coin.icon,
            coinName: coin.symbol,
            coinPrice: String(describing: price),
            coinPositionInTable: String(describing: indexPath.row + 1),
            coinPriceInDay: String("\((priceDay))\("%")")
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let feed = viewModel?.coin.coins?.count {
            return feed
        } else {
            return 0
        }
    }
}
//MARK: - Delegate
extension MarketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let coin = viewModel?.coin.coins?[indexPath.row] else { return }
        let viewController = DetailInfoCoinViewController(coinUrl: (coin.icon ?? ""),
                                                          coinName: (coin.name ?? "No name"),
                                                          coinSymbol: (coin.symbol ?? "No symbol"),
                                                          coinRank: String(describing: coin.rank ?? 0),
                                                          priceBTC: String(describing: coin.priceBtc ?? 0),
                                                          priceDollar: String(describing: coin.price ?? 0),
                                                          priceChange1Hour: String(describing: coin.priceChange1H ?? 0),
                                                          priceChange1Week: String(describing: coin.priceChange1W ?? 0))
        present(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0, y: 1)
        UIView.animate(withDuration: 0.5) {
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}

