//
//  CoinsNetwork.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 29.11.2022.
//

import Foundation

fileprivate enum APIType {
    case getCoin
    case getFeed
    
    var path: String {
        switch self {
        case .getCoin: return "coins?skip=0&limit=100&currency=EUR"
        case .getFeed: return "news?skip=0&limit=20"
        }
    }
    
    var baseURL: String {
        return "https://api.coinstats.app/public/v1/"
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        let request = URLRequest(url: url)
        return request
    }
}

class APIManager: ProtocolAPIType {
    static let shared = APIManager()
    
    func getCoin(completion: @escaping (Coin) -> Void) {
        let request = APIType.getCoin.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                guard let coin = try? JSONDecoder().decode(Coin.self, from: data) else { return }
                completion(coin)
            }
        }
        task.resume()
    }
    
    func getFeedCoin(completion: @escaping (FeedCoin) -> Void) {
        let request = APIType.getFeed.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                guard let feed = try? JSONDecoder().decode(FeedCoin.self, from: data) else { return }
                completion(feed)
            }
        }
        task.resume()
    }
    
}
