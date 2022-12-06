//
//  MarketTableViewCellProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 01.12.2022.
//

import UIKit

protocol MarketTableViewCellProtocol {
    static var identifier: String { get }
    var cellStackView: UIStackView { get }
    var coinIcon: UIImageView { get }
    var coinPositionInTable: CLabel { get }
    var coinName: CLabel { get }
    var coinPrice: CLabel { get}
    var coinPriceChange1Day: CLabel { get }
    
    func createStackView()
    func configureCell(coinIcon: String?, coinName: String?, coinPrice: String?, coinPositionInTable: String?, coinPriceInDay: String?)
}
