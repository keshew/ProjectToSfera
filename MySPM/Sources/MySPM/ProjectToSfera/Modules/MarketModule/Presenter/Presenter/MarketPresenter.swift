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
        DispatchQueue.main.async {
            self.view?.viewModel = CoinViewModel()
            self.view?.viewModel?.coin = coin
            self.view?.tableView.reloadData()
        }
    }
    
    func viewDidLoaded() {
        interactor.getCoinInfoFromNetwork()
    }
}




