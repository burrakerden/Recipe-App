//
//  Items+CoreDataProperties.swift
//  Recipe App
//
//  Created by Burak Erden on 5.04.2023.
//
//

import Foundation
import CoreData


extension Items {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Items> {
        return NSFetchRequest<Items>(entityName: "Items")
    }

    @NSManaged public var name: String?
    @NSManaged public var mealType: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var macros: String?
    @NSManaged public var directions: String?
    @NSManaged public var cuisineType: String?
    @NSManaged public var isFav: Bool
    @NSManaged public var uuid: UUID?
    @NSManaged public var image: String?
    @NSManaged public var calories: String?
    @NSManaged public var yields: String?

}

extension Items : Identifiable {

}
