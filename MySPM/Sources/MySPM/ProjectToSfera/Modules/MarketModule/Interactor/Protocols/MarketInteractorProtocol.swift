//
//  MarketInteractorProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 01.12.2022.
//

import Foundation

protocol MarketInteractorProtocol: AnyObject {
    var apiManager: APIManager { get }
    func getCoinInfoFromNetwork()
}


