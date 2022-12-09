//
//  ExtensionViewController.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import UIKit
extension AddingFactsViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        presenter?.placeHolderTexteView(textView: textView)
    }
}
