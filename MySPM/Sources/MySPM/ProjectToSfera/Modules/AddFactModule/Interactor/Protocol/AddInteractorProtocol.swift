//
//  AddInteractorProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import Foundation
protocol AddingFactsInteractorProtocol: AnyObject {
    func gotInfoFromPresenter(textOfField: String, textOfView: String)
}
