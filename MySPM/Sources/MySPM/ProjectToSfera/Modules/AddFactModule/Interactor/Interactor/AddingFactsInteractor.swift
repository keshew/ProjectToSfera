//
//  AddingFactsInteractor.swift
//  Super easy dev
//
//  Created by Артём Коротков on 07.12.2022
//
import UIKit
import CoreData
class AddingFactsInteractor: AddingFactsInteractorProtocol {
    weak var presenter: AddingFactsPresenterProtocol?
    var newFact: Facts?
    
    func gotInfoFromPresenter(image: UIImage, textOfField: String, textOfView: String) {
        if newFact == nil {
            newFact = Facts()
        }
        if let fact = newFact {
            fact.image = image.pngData()
            fact.title = textOfField
            fact.fact = textOfView
            CoreDataManager.shared.saveContext()
        }
    }
}
