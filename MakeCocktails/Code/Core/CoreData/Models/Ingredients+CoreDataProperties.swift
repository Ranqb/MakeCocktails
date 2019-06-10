//
//  Ingredients+CoreDataProperties.swift
//  
//
//  Created by Andrey Nedov on 09/06/2019.
//
//

import Foundation
import CoreData


extension Ingredients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredients> {
        return NSFetchRequest<Ingredients>(entityName: "Ingredients")
    }

    @NSManaged public var name: String?
    @NSManaged public var measure: String?
    @NSManaged public var drink: Drink?

}
