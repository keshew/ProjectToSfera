//
//  ProtocolCoinViewModel.swift
//  
//
//  Created by Артём Коротков on 29.12.2022.
//

import Foundation

protocol ProtocolCoinViewModel: AnyObject {
    static var shared: CoinViewModel { get }
    init()
    var coin: Coin { get set }
}
