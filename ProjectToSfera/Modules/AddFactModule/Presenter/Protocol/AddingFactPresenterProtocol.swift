//
//  AddingFactPresenterProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import UIKit
protocol AddingFactsPresenterProtocol: AnyObject {
    func setInfoCoreDate(image: UIImage, textOfField: String, textOfView: String)
    func placeHolderTexteView(textView: UITextView)
}
