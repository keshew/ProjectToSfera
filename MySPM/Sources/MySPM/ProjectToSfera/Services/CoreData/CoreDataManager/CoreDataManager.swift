//  ProjectToSfera
//
//  Created by Артём Коротков on 29.11.2022.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    lazy var fact: [Facts] = []
    lazy var request: NSFetchRequest<Facts> = Facts.fetchRequest()
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    func entityForName(entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: context)!
    }
    //MARK: - publuic func
    func saveNewFact(textOfField: String, textOfView: String) {
        let newFact = Facts()
        newFact.image = UIImage(named: "test", in: .module, compatibleWith: nil)?.pngData()
        newFact.title = textOfField
        newFact.fact = textOfView
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchRequest() {
        do {
            fact = try context.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func infoPlistFile() {
        var records = 0
        do {
            let count = try CoreDataManager.shared.context.count(for: request)
            records = count
        } catch {
            print(error.localizedDescription)
        }
        guard records == 0 else { return }
        guard let pathToFile = Bundle.main.path(forResource: "PropertyList", ofType: "plist") else { return}
        guard let dataArray = NSArray(contentsOfFile: pathToFile) else { return }
        for dictionary in dataArray {
            let facts = Facts()
            let factsDictionary = dictionary as! NSDictionary
            guard let imageName = factsDictionary ["image"] as? String else { return }
            
            facts.title = factsDictionary["title"] as? String
            facts.fact = factsDictionary["fact"] as? String
           
            let image = UIImage(named: imageName, in: .module, compatibleWith: nil)
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
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
