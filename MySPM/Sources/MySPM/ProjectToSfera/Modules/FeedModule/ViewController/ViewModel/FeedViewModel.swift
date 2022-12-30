//
//  FeedViewModel.swift
//  
//
//  Created by Артём Коротков on 29.12.2022.
//

import Foundation

final class FeedViewModel: ProtocolFeedViewModel {
    static var shared = FeedViewModel()
    init() {}
    var feed: FeedCoin?
}
