//
//  AddFactViewControllerProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import UIKit
protocol AddingFactsViewProtocol: AnyObject {
    var stackView: UIStackView { get }
    var titleTextField: UITextField { get }
    var factTextView: UITextView { get }
    func hideKeyboard()
    func dismissKeyboard()
    func saveNavigationItem()
    func saveInfo()
    func cancelNavigationItem()
    func cancelButton()
    func configureView()
    func configureStackView()
}
