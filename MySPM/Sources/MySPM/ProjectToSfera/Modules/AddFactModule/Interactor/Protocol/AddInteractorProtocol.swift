//
//  AddInteractorProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import UIKit
protocol AddingFactsInteractorProtocol: AnyObject {
    func gotInfoFromPresenter(image: UIImage, textOfField: String, textOfView: String)
}
