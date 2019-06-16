//
//  DrinkModel.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

struct ResultDrinks: Codable {
    var drinks: [DrinkModel]
    
    enum CodingKeys: String, CodingKey {
        case drinks = "drinks"
    }
}

struct DrinkModel: Codable {
    
    var id: String?
    var name: String?
    var category: String?
    var alcoholic: String?
    var glass: String?
    var recipe: String?
    var imageURL: String?
    // search if we can transform it into a dictionary
    var ingredient1: String?
    var ingredient2: String?
    var ingredient3: String?
    var ingredient4: String?
    var ingredient5: String?
    var ingredient6: String?
    var ingredient7: String?
    var ingredient8: String?
    var ingredient9: String?
    var ingredient10: String?
    var ingredient11: String?
    var ingredient12: String?
    var ingredient13: String?
    var ingredient14: String?
    var ingredient15: String?
    var measure1: String?
    var measure2: String?
    var measure3: String?
    var measure4: String?
    var measure5: String?
    var measure6: String?
    var measure7: String?
    var measure8: String?
    var measure9: String?
    var measure10: String?
    var measure11: String?
    var measure12: String?
    var measure13: String?
    var measure14: String?
    var measure15: String?
    var isInStorage: Bool = false

    init(id: String?,
         name: String?,
         category: String?,
         alcoholic: String?,
         glass: String?,
         recipe: String?,
         imageURL: String?,
         ingredient1: String?,
         ingredient2: String?,
         ingredient3: String?,
         ingredient4: String?,
         ingredient5: String?,
         ingredient6: String?,
         ingredient7: String?,
         ingredient8: String?,
         ingredient9: String?,
         ingredient10: String?,
         ingredient11: String?,
         ingredient12: String?,
         ingredient13: String?,
         ingredient14: String?,
         ingredient15: String?,
         measure1: String?,
         measure2: String?,
         measure3: String?,
         measure4: String?,
         measure5: String?,
         measure6: String?,
         measure7: String?,
         measure8: String?,
         measure9: String?,
         measure10: String?,
         measure11: String?,
         measure12: String?,
         measure13: String?,
         measure14: String?,
         measure15: String?,
         isInStorage: Bool) {
        self.id = id
        self.name = name
        self.category = category
        self.alcoholic = alcoholic
        self.glass = glass
        self.recipe = recipe
        self.imageURL = imageURL
        self.ingredient1 = ingredient1
        self.ingredient2 = ingredient2
        self.ingredient3 = ingredient3
        self.ingredient4 = ingredient4
        self.ingredient5 = ingredient5
        self.ingredient6 = ingredient6
        self.ingredient7 = ingredient7
        self.ingredient8 = ingredient8
        self.ingredient9 = ingredient9
        self.ingredient10 = ingredient10
        self.ingredient11 = ingredient11
        self.ingredient12 = ingredient12
        self.ingredient13 = ingredient13
        self.ingredient14 = ingredient14
        self.ingredient15 = ingredient15
        self.measure1 = measure1
        self.measure2 = measure2
        self.measure3 = measure3
        self.measure4 = measure4
        self.measure5 = measure5
        self.measure6 = measure6
        self.measure7 = measure7
        self.measure8 = measure8
        self.measure9 = measure9
        self.measure10 = measure10
        self.measure11 = measure11
        self.measure12 = measure12
        self.measure13 = measure13
        self.measure14 = measure14
        self.measure15 = measure15
        self.isInStorage = isInStorage
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case category = "strCategory"
        case alcoholic = "strAlcoholic"
        case glass = "strGlass"
        case recipe = "strInstructions"
        case imageURL = "strDrinkThumb"
        // search if we can transform it into a dictionary
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
    }
}
