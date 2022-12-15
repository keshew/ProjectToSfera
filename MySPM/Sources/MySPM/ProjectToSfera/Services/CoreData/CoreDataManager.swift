//
//  CoreDataManager.swift#imageLiteral(resourceName: "Снимок экрана 2022-12-13 в 02.48.39.png")
//  ProjectToSfera
//
//  Created by Артём Коротков on 29.11.2022.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    let tableview = UITableView()
    lazy var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Facts")
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let fetchResult = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                     managedObjectContext: context,
                                                     sectionNameKeyPath: nil, cacheName: nil)
        return fetchResult
    }()
    
    private init() {}
    
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    func entityForName(entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: context)!
    }
    //MARK: - publuic func
    func getFetch() {
        do {
            try fetchResultController.performFetch()
        } catch {
            print(error)
        }
    }
    
    func saveNewFact(image: UIImage, textOfField: String, textOfView: String) {
        var newFact: Facts?
        if newFact == nil {
            newFact = Facts()
        }
        if let fact = newFact {
            fact.image = image.pngData()
            fact.title = textOfField
            fact.fact = textOfView
            CoreDataManager.shared.saveContext()
        }
    }
    
    func infoPlistFile() {
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
            let image = UIImage(named: imageName!, in: .module, compatibleWith: nil)
            let imageData = image?.pngData()
            facts.image = imageData as Data?
        }
    }
    
    //MARK: - CoreData Stack
    public let persistentContainer: NSPersistentContainer = {
        guard let modelURL = Bundle.module.url(forResource: "ProjectToSfera", withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: modelURL) else { return NSPersistentContainer()}
        
        let container = NSPersistentContainer(name: "ProjectToSfera", managedObjectModel: model)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error (error), (error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
