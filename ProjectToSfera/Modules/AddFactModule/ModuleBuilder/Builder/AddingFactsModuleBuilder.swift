//
//  AddingFactsModuleBuilder.swift
//  Super easy dev
//
//  Created by Артём Коротков on 07.12.2022
//

import UIKit
class AddingFactsModuleBuilder: AddingFactsModuleBuilderProtocol {
    static func build() -> AddingFactsViewController {
        let interactor = AddingFactsInteractor()
        let router = AddingFactsRouter()
        let presenter = AddingFactsPresenter(interactor: interactor, router: router)
        let viewController = AddingFactsViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
