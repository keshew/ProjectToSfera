//
//  Facts+CoreDataClass.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 05.12.2022.
//
//

import Foundation
import CoreData

@objc(Facts)
public class Facts: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.shared.entityForName(entityName: "Facts"), insertInto: CoreDataManager.shared.context)
    }
}
