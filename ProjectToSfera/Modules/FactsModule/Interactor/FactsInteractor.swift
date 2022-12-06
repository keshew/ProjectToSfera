//
//  FactsInteractor.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//

protocol FactsInteractorProtocol: AnyObject {
}

class FactsInteractor: FactsInteractorProtocol {
    weak var presenter: FactsPresenterProtocol?
}
