//
//  UILabelExtension.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 01.12.2022.
//
import UIKit

class CLabel: UILabel {
    
    init(text: String? = nil,
         font: UIFont = .systemFont(ofSize: 17) ,
         textAligments: NSTextAlignment = .natural ,
         frame: CGRect = .zero,
         numberOfLines: Int = 1,
         textColor: UIColor = .black
    ) {
        super.init(frame: frame)
        self.text = text
        self.font = font
        self.textAlignment = textAligments
        self.numberOfLines = numberOfLines
        self.textColor = textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
