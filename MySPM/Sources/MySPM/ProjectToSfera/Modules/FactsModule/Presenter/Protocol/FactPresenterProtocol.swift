//
//  FactPresenterProtocol.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//

import CoreData
protocol FactsPresenterProtocol: AnyObject {
//    func getInfoFromPlistFile()
    func askToDateFromPlist()
    func getInfoFromArray()
    func getFetch(fetchResultController: NSFetchedResultsController<NSFetchRequestResult>)
}
