//
//  MarketInteractor.swift

//  Created by Артём Коротков on 28.11.2022
//
import Foundation

final class MarketInteractor: MarketInteractorProtocol {
    
    weak var presenter: MarketPresenterProtocol?
    var apiManager = APIManager()
    
    func getCoinInfoFromNetwork() {
        apiManager.getCoin(completion: { [weak self] coin in
            guard let self = self else { return }
            self.presenter?.didLoadInfoAboutCoins(coin: coin)
        })
    }
}
