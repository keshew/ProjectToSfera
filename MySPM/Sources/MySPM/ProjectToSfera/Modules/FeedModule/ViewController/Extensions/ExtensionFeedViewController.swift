//
//  ExtensionFeedViewController.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import UIKit

//MARK: - Delegate
extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 1, y: 0)
        UIView.animate(withDuration: 0.5) {
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.askToOpenURL(indexPath: indexPath)
    }
}

//MARK: - DataSourse
extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier,for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        let feed = viewModel?.feed
        cell.configureCell(
            feedIcon: feed?.news?[indexPath.row].imgURL,
            feedTitle: feed?.news?[indexPath.row].title,
            feedSource: feed?.news?[indexPath.row].source ,
            feedCoinRelated: feed?.news?[indexPath.row].relatedCoins?.first?.uppercased()
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let feed = viewModel?.feed?.news?.count {
            return feed
        } else {
            return 0
        }
    }
}
