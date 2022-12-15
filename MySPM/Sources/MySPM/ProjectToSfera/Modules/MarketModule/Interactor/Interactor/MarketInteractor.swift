//
//  MarketInteractor.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//
import Foundation

final class MarketInteractor: MarketInteractorProtocol{
    weak var presenter: MarketPresenterProtocol?
    var networkAPIManager: APIManager?
    
    func getCoinInfoFromNetwork() {
        networkAPIManager = APIManager()
        networkAPIManager?.getCoin(completion: { [weak self] coin in
            guard let self = self else { return }
            self.presenter?.didLoadInfoAboutCoins(coin: coin)
        })
    }
}




