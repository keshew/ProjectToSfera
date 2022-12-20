//
//  FactsModuleBuilder.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//

import UIKit

final class FactsModuleBuilder: FactModuleBuilderProtocol {
    static func build() -> FactsViewController {
        let interactor = FactsInteractor()
        let router = FactsRouter()
        let presenter = FactsPresenter(interactor: interactor, router: router)
        let viewController = FactsViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
