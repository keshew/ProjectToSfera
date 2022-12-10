//
//  ProtocolFeedTableViewCell.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import UIKit
protocol ProtocolFeedTableViewCell {
    static var identifier: String { get }
    var titleStackView: UIStackView { get }
    var coinInfoStackView: UIStackView { get }
    var mainStackView: UIStackView { get }
    var feedTitle: CLabel { get }
    var feedSource: CLabel { get }
    var feedCoinRelated: CLabel { get }
    var feedIcon: UIImageView { get }
    
    func configureStackView()
    func configureCell(feedIcon: String?, feedTitle: String?, feedSource: String?, feedCoinRelated: String?)
}
