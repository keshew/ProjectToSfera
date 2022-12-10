//
//  DetailInfoCoinProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import UIKit
protocol DetailInfoCoinViewProtocol: AnyObject {
    var coinImage: UIImageView { get }
    var coinName: CLabel { get }
    var coinSymbol: CLabel { get }
    var priceInBTC: CLabel { get }
    var priceInDollar: CLabel { get }
    var priceChange1Hour: CLabel { get }
    var priceChange1Week: CLabel { get }
    var coinRank: CLabel { get }
}
