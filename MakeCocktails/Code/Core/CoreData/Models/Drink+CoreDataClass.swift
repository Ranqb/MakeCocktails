//
//  Drink+CoreDataClass.swift
//  
//
//  Created by Andrey Nedov on 16/06/2019.
//
//

import Foundation
import CoreData

@objc(Drink)
public class Drink: NSManagedObject {
    func fetch() -> DrinkModel {
        let drinkModel = DrinkModel(id : drinkID,
                                    name : name,
                                    category : category,
                                    alcoholic : alcoholic,
                                    glass : glass,
                                    recipe : recipe,
                                    imageURL : imageURL,
                                    ingredient1 : ingredient1,
                                    ingredient2 : ingredient2,
                                    ingredient3 : ingredient3,
                                    ingredient4 : ingredient4,
                                    ingredient5 : ingredient5,
                                    ingredient6 : ingredient6,
                                    ingredient7 : ingredient7,
                                    ingredient8 : ingredient8,
                                    ingredient9 : ingredient9,
                                    ingredient10 : ingredient10,
                                    ingredient11 : ingredient11,
                                    ingredient12 : ingredient12,
                                    ingredient13 : ingredient13,
                                    ingredient14 : ingredient14,
                                    ingredient15 : ingredient15,
                                    measure1 : measure1,
                                    measure2 : measure2,
                                    measure3 : measure3,
                                    measure4 : measure4,
                                    measure5 : measure5,
                                    measure6 : measure6,
                                    measure7 : measure7,
                                    measure8 : measure8,
                                    measure9 : measure9,
                                    measure10 : measure10,
                                    measure11 : measure11,
                                    measure12 : measure12,
                                    measure13 : measure13,
                                    measure14 : measure14,
                                    measure15 : measure15,
                                    isInStorage : true)
        return drinkModel
    }

    func add(newDrink: DrinkModel) {
        drinkID = newDrink.id
        name = newDrink.name
        category = newDrink.category
        alcoholic = newDrink.alcoholic
        glass = newDrink.glass
        recipe = newDrink.recipe
        imageURL = newDrink.imageURL
        ingredient1 = newDrink.ingredient1
        ingredient2 = newDrink.ingredient2
        ingredient3 = newDrink.ingredient3
        ingredient4 = newDrink.ingredient4
        ingredient5 = newDrink.ingredient5
        ingredient6 = newDrink.ingredient6
        ingredient7 = newDrink.ingredient7
        ingredient8 = newDrink.ingredient8
        ingredient9 = newDrink.ingredient9
        ingredient10 = newDrink.ingredient10
        ingredient11 = newDrink.ingredient11
        ingredient12 = newDrink.ingredient12
        ingredient13 = newDrink.ingredient13
        ingredient14 = newDrink.ingredient14
        ingredient15 = newDrink.ingredient15
        measure1 = newDrink.measure1
        measure2 = newDrink.measure2
        measure3 = newDrink.measure3
        measure4 = newDrink.measure4
        measure5 = newDrink.measure5
        measure6 = newDrink.measure6
        measure7 = newDrink.measure7
        measure8 = newDrink.measure8
        measure9 = newDrink.measure9
        measure10 = newDrink.measure10
        measure11 = newDrink.measure11
        measure12 = newDrink.measure12
        measure13 = newDrink.measure13
        measure14 = newDrink.measure14
        measure15 = newDrink.measure15
        isInStorage = newDrink.isInStorage
    }
}
