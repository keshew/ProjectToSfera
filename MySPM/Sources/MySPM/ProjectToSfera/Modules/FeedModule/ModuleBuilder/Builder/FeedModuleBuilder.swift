//
//  FeedModuleBuilder.swift
//  Super easy dev
//
//  Created by Артём Коротков on 28.11.2022
//

import UIKit

class FeedModuleBuilder {
    static func build() -> FeedViewController {
        let interactor = FeedInteractor()
        let router = FeedRouter()
        let presenter = FeedPresenter(interactor: interactor, router: router)
        let viewController = FeedViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
