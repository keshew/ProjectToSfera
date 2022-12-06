//
//  ExtensionFeedViewController.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import UIKit

extension FeedViewController: FeedViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
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
        presenter?.askToOpenURL(feed: feed!, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let feed = feed!.news?.count {
            return feed
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier,for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        guard let path = self.feed?.news?[indexPath.row] else { return UITableViewCell() }
        cell.configureCell(
            feedIcon: path.imgURL,
            feedTitle: path.title,
            feedSource: path.source ,
            feedCoinRelated: path.relatedCoins?.first?.uppercased()
        )
        return cell
    }
}
