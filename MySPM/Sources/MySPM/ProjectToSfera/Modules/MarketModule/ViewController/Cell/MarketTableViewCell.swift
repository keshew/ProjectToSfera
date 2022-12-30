//
//  MarketTableViewCell.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 29.11.2022.
//

import UIKit
import Kingfisher


final class MarketTableViewCell: UITableViewCell {
    fileprivate enum Constants {
        static var padding: CGFloat = 60
    }
    
    static var identifier: String {
        String(describing: self)
    }
    
    //MARK: - UIElements
    private var cellStackView = UIStackView()
    private let coinIcon = UIImageView()
    private let coinPositionInTable = CLabel()
    private let coinName = CLabel(font: .systemFont(ofSize: 17,weight: .bold))
    
    private let coinPrice: CLabel = {
        var coin = CLabel(font: .systemFont(ofSize: 15), textAligments: .center)
        coin.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return coin
    }()
    private let coinPriceChange1Day: CLabel = {
        let price = CLabel(font: .systemFont(ofSize: 12,weight: .bold), textAligments: .center)
        price.layer.masksToBounds = true
        price.layer.cornerRadius = 10
        price.textColor = .mainBlueColor
        price.backgroundColor = .backgroundPriceColor
        price.setContentCompressionResistancePriority(.defaultHigh + 1, for: .horizontal)
        return price
    }()
    
    //MARK: - INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createStackView()
        let margins = layoutMarginsGuide
        NSLayoutConstraint.activate([
            cellStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            margins.trailingAnchor.constraint(equalTo: cellStackView.trailingAnchor),
            cellStackView.topAnchor.constraint(equalTo: margins.topAnchor),
            margins.bottomAnchor.constraint(equalTo: cellStackView.bottomAnchor),
            
            coinIcon.widthAnchor.constraint(equalToConstant: Constants.padding / 3),
            margins.trailingAnchor.constraint(equalTo: coinPriceChange1Day.trailingAnchor),
            coinPriceChange1Day.widthAnchor.constraint(equalToConstant: Constants.padding),
            coinPriceChange1Day.leadingAnchor.constraint(equalTo: coinPrice.trailingAnchor,constant: Constants.padding / 6)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Func
    private func createStackView() {
        cellStackView = UIStackView(arrangedSubviews: [coinPositionInTable,coinIcon,coinName,coinPrice,coinPriceChange1Day])
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.spacing = 10
        contentView.addSubview(cellStackView)
    }
    
    private func hasPrefix(text: String) -> String {
        if text.hasPrefix("-") {
            coinPriceChange1Day.textColor = .minusTextColor
            coinPriceChange1Day.backgroundColor = .minusBackgroundColor
        } else {
            coinPriceChange1Day.textColor = .plusTextColor
            coinPriceChange1Day.backgroundColor = .plusBackgroundColor
        }
        return text
    }

    func configureCell(coinIcon: String?, coinName: String?, coinPrice: String?, coinPositionInTable: String?, coinPriceInDay: String?) {
        guard let iconURL = URL(string: coinIcon!) else { return }
        guard let coinPriceIn1Day = coinPriceInDay else { return }
        self.coinIcon.kf.setImage(with: iconURL, placeholder: UIImage(named: "defaultCoin", in: .module, compatibleWith: nil))
        self.coinName.text = coinName ?? "No name"
        self.coinPrice.text = coinPrice ?? "No price"
        self.coinPositionInTable.text = coinPositionInTable
        self.coinPriceChange1Day.text = hasPrefix(text: coinPriceIn1Day)
    }
}










