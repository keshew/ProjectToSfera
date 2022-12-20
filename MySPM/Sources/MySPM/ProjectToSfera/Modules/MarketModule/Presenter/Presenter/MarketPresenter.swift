//
//  MarketPresenter.swift
//  Created by Артём Коротков on 28.11.2022
//
import Foundation

final class MarketPresenter: MarketPresenterProtocol {
    weak var view: MarketViewControllerProtocol?
    var router: MarketRouterProtocol
    var interactor: MarketInteractorProtocol
    
    init(interactor: MarketInteractorProtocol, router: MarketRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func didLoadInfoAboutCoins(coin: Coin) {
        view?.getInfoAboutCoins(coin: coin)
    }
    
    func viewDidLoaded() {
        interactor.getCoinInfoFromNetwork()
    }
}




