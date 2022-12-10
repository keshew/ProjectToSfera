//
//  ProtocolAPIType.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import Foundation
protocol ProtocolAPIType {
    static var shared: APIManager { get }
    func getCoin(completion: @escaping (Coin) -> Void)
    func getFeedCoin(completion: @escaping (FeedCoin) -> Void)
}
