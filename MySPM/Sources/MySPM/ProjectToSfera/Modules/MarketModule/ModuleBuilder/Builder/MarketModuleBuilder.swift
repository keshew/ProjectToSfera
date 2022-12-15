//
//  MarketModuleBuilder.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//

import UIKit

final class MarketModuleBuilder {
    static func build() -> MarketViewController {        
        let router = MarketRouter()
        let interactor = MarketInteractor()
        let presenter = MarketPresenter(interactor: interactor, router: router)
        let viewController = MarketViewController()
        presenter.view = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
