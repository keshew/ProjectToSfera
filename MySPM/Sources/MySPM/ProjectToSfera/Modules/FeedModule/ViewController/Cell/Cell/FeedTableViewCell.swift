//
//  FeedTableViewCell.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 01.12.2022.
//

import UIKit
import Kingfisher

class FeedTableViewCell: UITableViewCell, ProtocolFeedTableViewCell {
   fileprivate enum Constants {
       static var sizeImage: CGFloat = 100
        static var padding: CGFloat = 10
        static var smallFontSize: CGFloat = 12
    }
    
    static var identifier: String {
        String(describing: self)
    }
    
    //MARK: - UIElements
    
    var titleStackView = UIStackView()
    var coinInfoStackView = UIStackView()
    var mainStackView = UIStackView()
    var feedTitle = CLabel(font: .systemFont(ofSize: 17,weight: .bold), numberOfLines: 0)
    var feedSource = CLabel(font: .systemFont(ofSize: Constants.smallFontSize, weight: .light), textColor: .coinSourceColor)
    var feedCoinRelated = CLabel(font: .systemFont(ofSize: Constants.smallFontSize, weight: .regular), textColor: .coinRelatedColor)
    
    var feedIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleToFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.layer.masksToBounds = true
        icon.layer.cornerRadius = 20
        return icon
    }()
    
    //MARK: - INIT
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureStackView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Func
    
    func setupView() {
        contentView.addSubview(feedIcon)
        contentView.addSubview(mainStackView)
        let margins = layoutMarginsGuide
        NSLayoutConstraint.activate([
            feedIcon.heightAnchor.constraint(equalToConstant: Constants.sizeImage),
            feedIcon.widthAnchor.constraint(equalToConstant: Constants.sizeImage),
            feedIcon.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: Constants.padding / 2),
            feedIcon.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Constants.padding),
            mainStackView.leadingAnchor.constraint(equalTo: feedIcon.trailingAnchor, constant: Constants.padding * 2),
            margins.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            margins.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor)])
    }
    
    func configureStackView() {
        titleStackView = UIStackView(arrangedSubviews: [feedTitle])
        coinInfoStackView = UIStackView(arrangedSubviews: [feedCoinRelated,feedSource])
        mainStackView = UIStackView(arrangedSubviews: [titleStackView,coinInfoStackView])
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        feedSource.textAlignment = .right
        titleStackView.alignment = .top
        mainStackView.spacing = Constants.padding / 2
        coinInfoStackView.spacing = Constants.padding
    }

    func configureCell(feedIcon: String?, feedTitle: String?, feedSource: String?, feedCoinRelated: String?) {
        self.feedIcon.kf.indicatorType = .activity
        self.feedIcon.kf.setImage(with: URL(string: feedIcon!), placeholder: UIImage(named: "defaultCoin", in: .module, compatibleWith: nil))
        self.feedTitle.text =  feedTitle ?? "No title"
        self.feedSource.text = feedSource ?? "No source"
        self.feedCoinRelated.text = feedCoinRelated ?? "No coin related"
    }
}
