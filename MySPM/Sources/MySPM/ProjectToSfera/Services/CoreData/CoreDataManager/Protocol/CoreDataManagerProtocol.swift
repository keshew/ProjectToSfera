//
//  CoreDataManagerProtocol.swift
//  
//
//  Created by Артём Коротков on 20.12.2022.
//

import CoreData

protocol CoreDataManagerProtocol {
    static var shared: CoreDataManager { get }
    var fact: [Facts] { get }
    var context: NSManagedObjectContext { get }
    var persistentContainer: NSPersistentContainer { get }
    
    func entityForName(entityName: String) -> NSEntityDescription
    func saveNewFact(textOfField: String, textOfView: String)
    func fetchRequest()
    func infoPlistFile()
    func saveContext ()
}
