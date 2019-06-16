//
//  Drink+CoreDataProperties.swift
//  
//
//  Created by Andrey Nedov on 16/06/2019.
//
//

import Foundation
import CoreData


extension Drink {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drink> {
        return NSFetchRequest<Drink>(entityName: "Drink")
    }

    @NSManaged public var alcoholic: String?
    @NSManaged public var category: String?
    @NSManaged public var glass: String?
    @NSManaged public var drinkID: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var ingredient1: String?
    @NSManaged public var ingredient2: String?
    @NSManaged public var ingredient3: String?
    @NSManaged public var isInStorage: Bool
    @NSManaged public var name: String?
    @NSManaged public var recipe: String?
    @NSManaged public var ingredient4: String?
    @NSManaged public var ingredient5: String?
    @NSManaged public var ingredient7: String?
    @NSManaged public var ingredient6: String?
    @NSManaged public var ingredient8: String?
    @NSManaged public var ingredient9: String?
    @NSManaged public var ingredient10: String?
    @NSManaged public var ingredient11: String?
    @NSManaged public var ingredient12: String?
    @NSManaged public var ingredient13: String?
    @NSManaged public var ingredient14: String?
    @NSManaged public var ingredient15: String?
    @NSManaged public var measure1: String?
    @NSManaged public var measure2: String?
    @NSManaged public var measure3: String?
    @NSManaged public var measure4: String?
    @NSManaged public var measure5: String?
    @NSManaged public var measure6: String?
    @NSManaged public var measure7: String?
    @NSManaged public var measure8: String?
    @NSManaged public var measure9: String?
    @NSManaged public var measure10: String?
    @NSManaged public var measure11: String?
    @NSManaged public var measure12: String?
    @NSManaged public var measure13: String?
    @NSManaged public var measure14: String?
    @NSManaged public var measure15: String?

}
