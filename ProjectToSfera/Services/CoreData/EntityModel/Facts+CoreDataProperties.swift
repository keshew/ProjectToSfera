//
//  Facts+CoreDataProperties.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 05.12.2022.
//
//

import Foundation
import CoreData


extension Facts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Facts> {
        return NSFetchRequest<Facts>(entityName: "Facts")
    }

    @NSManaged public var image: Data?
    @NSManaged public var title: String?
    @NSManaged public var fact: String?

}

extension Facts : Identifiable {

}
