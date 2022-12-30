//
//  CoinViewModel.swift  
//
//  Created by Артём Коротков on 29.12.2022.
//

import Foundation

final class CoinViewModel: ProtocolCoinViewModel {
    static var shared = CoinViewModel()
    init() {}
    var coin: Coin = Coin(coins: [CoinElement]())
}
