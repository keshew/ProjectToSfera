//
//  ProtocolFeedViewModel.swift
//  
//
//  Created by Артём Коротков on 29.12.2022.
//

import Foundation

protocol ProtocolFeedViewModel: AnyObject {
    static var shared: FeedViewModel { get }
    init()
    var feed: FeedCoin? { get set}
}
