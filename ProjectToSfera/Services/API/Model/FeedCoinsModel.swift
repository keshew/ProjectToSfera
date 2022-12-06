//
//  FeedCoinsModel.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 29.11.2022.

//import Foundation
//
//// MARK: - FeedCoin
//struct FeedCoin: Codable {
//    let news: [News]?
//}
//
//// MARK: - News
//struct News: Codable {
//    let id: String?
//    let searchKeyWords: [String]?
//    let feedDate: Int?
//    let source, title, newsDescription: String?
//    let imgURL: String?
//    let link: String?
//    let sourceLink: String?
//    let reactionsCount: ReactionsCount?
//    let shareURL: String?
//    let relatedCoins: [String]?
//    let content: Bool?
//    let coins: [CoinFromNews]?
//
//    enum CodingKeys: String, CodingKey {
//        case id, searchKeyWords, feedDate, source, title
//        case newsDescription = "description"
//        case imgURL, link, sourceLink, reactionsCount, shareURL, relatedCoins, content, coins
//    }
//}
//
//// MARK: - Coin
//struct CoinFromNews: Codable {
//    let coinKeyWords: String?
//    let coinPercent: Double?
//    let coinTitleKeyWords, coinNameKeyWords, coinIDKeyWords: String?
//
//    enum CodingKeys: String, CodingKey {
//        case coinKeyWords, coinPercent, coinTitleKeyWords, coinNameKeyWords
//        case coinIDKeyWords = "coinIdKeyWords"
//    }
//}
//
//// MARK: - ReactionsCount
//struct ReactionsCount: Codable {
//}
//
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let feedCoin = try? newJSONDecoder().decode(FeedCoin.self, from: jsonData)

import Foundation

// MARK: - FeedCoin
struct FeedCoin: Codable {
    let news: [News]?
}

// MARK: - News
struct News: Codable {
    let id: String?
    let searchKeyWords: [String?]?
    let feedDate: Int?
    let source, title, newsDescription: String?
    let imgURL: String?
    let link, sourceLink: String?
    let reactionsCount: [String: Int]?
    let shareURL: String?
    let relatedCoins: [String]?
    let content: Bool?
    let coins: [Coins]?

    enum CodingKeys: String, CodingKey {
        case id, searchKeyWords, feedDate, source, title
        case newsDescription = "description"
        case imgURL, link, sourceLink, reactionsCount, shareURL, relatedCoins, content, coins
    }
}

// MARK: - Coin
struct Coins: Codable {
    let coinKeyWords: String?
    let coinPercent: Double?
    let coinTitleKeyWords, coinNameKeyWords, coinIDKeyWords: String?

    enum CodingKeys: String, CodingKey {
        case coinKeyWords, coinPercent, coinTitleKeyWords, coinNameKeyWords
        case coinIDKeyWords = "coinIdKeyWords"
    }
}
