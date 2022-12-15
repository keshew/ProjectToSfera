//
//  AddingFactsInteractor.swift
//  Super easy dev
//
//  Created by Артём Коротков on 07.12.2022
//
import UIKit

final class AddingFactsInteractor: AddingFactsInteractorProtocol {
    weak var presenter: AddingFactsPresenterProtocol?
    func gotInfoFromPresenter(image: UIImage, textOfField: String, textOfView: String) {
        CoreDataManager.shared.saveNewFact(image: image,
                                           textOfField: textOfField,
                                           textOfView: textOfView)
    }
}
