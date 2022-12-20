//
//  AddingFactsPresenter.swift
//  Super easy dev
//
//  Created by Артём Коротков on 07.12.2022
//
import UIKit

final class AddingFactsPresenter: AddingFactsPresenterProtocol {
    
    weak var view: AddingFactsViewProtocol?
    var router: AddingFactsRouterProtocol
    var interactor: AddingFactsInteractorProtocol

    init(interactor: AddingFactsInteractorProtocol, router: AddingFactsRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func placeHolderTexteView(textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .black
            textView.font = .systemFont(ofSize: 17)
        }
    }
    
    func setInfoCoreDate(textOfField: String, textOfView: String) {
        interactor.gotInfoFromPresenter(textOfField: textOfField, textOfView: textOfView)
    }
}

