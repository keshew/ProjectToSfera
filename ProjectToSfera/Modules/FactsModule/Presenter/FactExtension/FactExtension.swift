//
//  FactExtension.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 09.12.2022.
//
import UIKit
import CoreData
extension FactsPresenter: FactsPresenterProtocol {
    func getInfoFromArray() {
        let fetchRequest: NSFetchRequest<Facts> = Facts.fetchRequest()
        do {
            let result = try? CoreDataManager.shared.context.fetch(fetchRequest)
            guard let results = result else { return }
            view?.getArray(facts: results)
        }
    }
    
    func getInfoFromPlistFile() {
        let fetchRequest: NSFetchRequest<Facts> = Facts.fetchRequest ()
        var records = 0
        do {
            let count = try CoreDataManager.shared.context.count(for: fetchRequest)
            records = count
        } catch {
            print(error.localizedDescription)
        }
        guard records == 0 else { return }
        let pathToFile = Bundle.main.path(forResource: "PropertyList", ofType: "plist")
        let dataArray = NSArray(contentsOfFile: pathToFile!)!
        for dictionary in dataArray {
            let entity = NSEntityDescription.entity (forEntityName: "Facts", in: CoreDataManager.shared.context)
            let facts = NSManagedObject (entity: entity!, insertInto: CoreDataManager.shared.context) as! Facts
            let factsDictionary = dictionary as! NSDictionary
            facts.title = factsDictionary["title"] as? String
            facts.fact = factsDictionary["fact"] as? String
            let imageName = factsDictionary ["image"] as? String
            let image = UIImage(named: imageName!)
            let imageData = image?.pngData()
            facts.image = imageData as Data?
        }
    }
}
