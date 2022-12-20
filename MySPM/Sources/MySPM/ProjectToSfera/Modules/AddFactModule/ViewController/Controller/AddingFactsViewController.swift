//
//  AddingFactsViewController.swift
//  Super easy dev
//
//  Created by Артём Коротков on 07.12.2022
//

import UIKit

final class AddingFactsViewController: UIViewController, AddingFactsViewProtocol {
    
    var presenter: AddingFactsPresenterProtocol?
    
    var stackView = UIStackView()
    var titleTextField: UITextField = {
        let text = UITextField()
        text.font = .systemFont(ofSize: 17, weight: .medium)
        text.placeholder = "Введите заголовок"
        return text
    }()
    var factTextView: UITextView = {
        let fact = UITextView()
        fact.backgroundColor = .secondarySystemBackground
        fact.clipsToBounds = true
        fact.layer.cornerRadius = 10
        fact.font = .systemFont(ofSize: 17, weight: .regular)
        fact.text = "Введите факт"
        fact.textColor = .lightGray
        return fact
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        saveNavigationItem()
        cancelNavigationItem()
        configureStackView()
        hideKeyboard()
        factTextView.delegate = self
    }
    
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func saveNavigationItem() {
        let navigationItem = UIBarButtonItem(title: "Сохранить",
                                             style: .plain,
                                             target: self,
                                             action: #selector(saveInfo))
        navigationItem.tintColor = .black
        self.navigationItem.rightBarButtonItem = navigationItem
    }
    
    @objc func saveInfo() {
        guard let textFieldText = titleTextField.text else { return }
        presenter?.setInfoCoreDate(textOfField: textFieldText, textOfView: factTextView.text)
        dismiss(animated: true)
    }
    
    func cancelNavigationItem() {
        let navigationItem = UIBarButtonItem(title: "Назад",
                                             style: .plain,
                                             target: self,
                                             action: #selector(cancelButton))
        navigationItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = navigationItem
    }
    
    @objc func cancelButton() {
        dismiss(animated: true)
    }
    
    func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
    }
    
    func setupView() {
        title = "Новый факт"
        view.backgroundColor = .white
        stackView = UIStackView(arrangedSubviews: [titleTextField, factTextView])
        view.addSubview(stackView)
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: margins.topAnchor,constant: 20),
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            margins.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            margins.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10)
        ])
    }
}

