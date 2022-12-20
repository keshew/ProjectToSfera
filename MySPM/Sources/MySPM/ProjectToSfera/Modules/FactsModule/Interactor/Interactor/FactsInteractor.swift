//
//  FactsInteractor.swift
//
//
//  Created by Артём Коротков on 28.11.2022
//
import Foundation

final class FactsInteractor: FactsInteractorProtocol {
    
    weak var presenter: FactsPresenterProtocol?
    
    func getInfoFromPlistFile() {
        CoreDataManager.shared.infoPlistFile()
    }
    func askFetch() {
        CoreDataManager.shared.fetchRequest()
    }
}
