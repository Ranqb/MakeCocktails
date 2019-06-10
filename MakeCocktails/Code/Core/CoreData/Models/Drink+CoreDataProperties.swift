//
//  Drink+CoreDataProperties.swift
//  
//
//  Created by Andrey Nedov on 09/06/2019.
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
    @NSManaged public var fieldsCount: Int16
    @NSManaged public var glass: String?
    @NSManaged public var id: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var isInStorage: Bool
    @NSManaged public var name: String?
    @NSManaged public var recipe: String?
    @NSManaged public var ingredients: NSOrderedSet?

}

// MARK: Generated accessors for ingredients
extension Drink {

    @objc(insertObject:inIngredientsAtIndex:)
    @NSManaged public func insertIntoIngredients(_ value: Ingredients, at idx: Int)

    @objc(removeObjectFromIngredientsAtIndex:)
    @NSManaged public func removeFromIngredients(at idx: Int)

    @objc(insertIngredients:atIndexes:)
    @NSManaged public func insertIntoIngredients(_ values: [Ingredients], at indexes: NSIndexSet)

    @objc(removeIngredientsAtIndexes:)
    @NSManaged public func removeFromIngredients(at indexes: NSIndexSet)

    @objc(replaceObjectInIngredientsAtIndex:withObject:)
    @NSManaged public func replaceIngredients(at idx: Int, with value: Ingredients)

    @objc(replaceIngredientsAtIndexes:withIngredients:)
    @NSManaged public func replaceIngredients(at indexes: NSIndexSet, with values: [Ingredients])

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: Ingredients)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: Ingredients)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSOrderedSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSOrderedSet)

}
