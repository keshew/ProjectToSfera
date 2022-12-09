//
//  FactsPresenter.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//
import UIKit
class FactsPresenter {
    weak var view: FactsViewProtocol?
    var router: FactsRouterProtocol
    var interactor: FactsInteractorProtocol
    
    init(interactor: FactsInteractorProtocol, router: FactsRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}





