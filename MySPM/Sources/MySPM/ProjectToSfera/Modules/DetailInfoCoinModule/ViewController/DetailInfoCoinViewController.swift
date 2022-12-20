//
//  DetailInfoCoinViewController.swift
//  Super easy dev
//
//  Created by Артём Коротков on 09.12.2022
//

import UIKit

final class DetailInfoCoinViewController: UIViewController, DetailInfoCoinViewProtocol {
    
    var coinName: CLabel = {
        let name = CLabel(font: .systemFont(ofSize: 17, weight: .semibold), textAligments: .center)
        name.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return name
    }()
    
    var coinImage = UIImageView()
    var coinSymbol = CLabel(font: .systemFont(ofSize: 17, weight: .semibold), textAligments: .left)
    var priceInBTC = CLabel(textAligments: .left)
    var priceInDollar = CLabel(textAligments: .left)
    var priceChange1Hour = CLabel(textAligments: .left)
    var priceChange1Week = CLabel(textAligments: .left)
    var coinRank = CLabel(textAligments: .left)
    
    
    init(coinUrl: String, coinName: String, coinSymbol: String, coinRank: String, priceBTC: String, priceDollar: String, priceChange1Hour: String, priceChange1Week: String){
        self.coinImage.kf.setImage(with: URL(string: coinUrl))
        self.coinRank.text = ("Rank: #\(coinRank)")
        self.coinName.text = coinName
        self.coinSymbol.text = coinSymbol
        self.priceInBTC.text = ("Price: \(priceBTC) BTC")
        self.priceInDollar.text = ("Price: \(priceDollar)$")
        self.priceChange1Hour.text = ("Price change in 1 hour: \(priceChange1Hour)$")
        self.priceChange1Week.text = ("Price change in 1 week: \(priceChange1Week)$")
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = .white
        let infoAboutCoinStackView = UIStackView(arrangedSubviews: [coinImage,coinName,coinSymbol])
        let priceStackView = UIStackView(arrangedSubviews: [coinRank,priceInBTC,priceInDollar,priceChange1Hour,priceChange1Week])
        let mainStackView = UIStackView(arrangedSubviews: [infoAboutCoinStackView,priceStackView])
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        priceStackView.distribution = .fillProportionally
        priceStackView.axis = .vertical
        mainStackView.axis = .vertical
        
        view.addSubview(mainStackView)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: margins.topAnchor,constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            margins.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            margins.bottomAnchor.constraint(equalTo:  mainStackView.bottomAnchor,constant: 10),
            
            coinImage.widthAnchor.constraint(equalToConstant: 50),
            coinImage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupView(name: String, symbol: String, rank: String, image: UIImageView) {
        self.coinImage = image
        self.coinRank.text = rank
        self.coinSymbol.text = symbol
        self.coinName.text = name
    }
}
