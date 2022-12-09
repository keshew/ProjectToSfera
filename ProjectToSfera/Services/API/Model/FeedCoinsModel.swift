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
