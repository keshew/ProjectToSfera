//
//  AddingFactsInteractor.swift
//  Created by Артём Коротков on 07.12.2022
//
import Foundation

final class AddingFactsInteractor: AddingFactsInteractorProtocol {
    
    weak var presenter: AddingFactsPresenterProtocol?
    
    func gotInfoFromPresenter(textOfField: String, textOfView: String) {
        CoreDataManager.shared.saveNewFact(textOfField: textOfField, textOfView: textOfView)
    }
}
