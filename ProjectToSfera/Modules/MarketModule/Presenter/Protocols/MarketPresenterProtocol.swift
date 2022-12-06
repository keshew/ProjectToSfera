//
//  MarketPresenterProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 01.12.2022.
//

import UIKit

protocol MarketPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoadInfoAboutCoins(coin: Coin)
}
