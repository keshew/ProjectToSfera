//
//  File.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import UIKit

class FactTableViewCell: UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
    
     var stackView = UIStackView()
     var descriptison = CLabel(numberOfLines: 0)
    
     var imageOfCoin: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 25.0
        image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return image
    }()
     var title: CLabel = {
        let label = CLabel(font: .systemFont(ofSize: 20, weight: .bold), numberOfLines: 0)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private func configureStackView() {
        stackView.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        stackView.layer.cornerRadius = 25
        stackView.backgroundColor = .white
        stackView.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        stackView.layer.shadowOpacity = 0.3
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8.0, leading: 10.0, bottom: 10.0, trailing: 10.0)
        stackView.layer.shadowRadius = 7
        stackView.layer.shadowColor = UIColor.black.cgColor
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSV()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSV() {
        stackView = UIStackView(arrangedSubviews: [title,descriptison])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        addSubview(imageOfCoin)
        addSubview(stackView)
   
        let margins = layoutMarginsGuide
        NSLayoutConstraint.activate([
            imageOfCoin.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            margins.trailingAnchor.constraint(equalTo: imageOfCoin.trailingAnchor),
            imageOfCoin.topAnchor.constraint(equalTo: margins.topAnchor),
            
            stackView.topAnchor.constraint(equalTo: imageOfCoin.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            margins.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            margins.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            imageOfCoin.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    
}

