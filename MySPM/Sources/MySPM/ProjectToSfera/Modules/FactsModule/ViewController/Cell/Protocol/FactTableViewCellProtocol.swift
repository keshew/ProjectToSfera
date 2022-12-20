//
//  FactTableViewCellProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import UIKit
protocol FactTableViewCellProtocol {
    static var identifier: String { get }
    var stackView: UIStackView { get }
    var descriptison: CLabel { get }
    var imageOfCoin: UIImageView { get }
    var title: CLabel { get }
    func configureStackView()
    func setupView()
}
