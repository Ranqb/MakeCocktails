//
//  ServicesProtocol.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import Foundation

protocol ServicesProtocol {
    func getIngredientsList(completion: @escaping (Result<[String]?>) -> Void)
    func getPopularDrinks(completion: @escaping (Result<[DrinkModel]?>) -> Void)
    func getDrinksByName(_ text: String, completion: @escaping (Result<[DrinkModel]?>) -> Void)
    func getDrinksByIngredients(_ text: String, completion: @escaping (Result<[DrinkModel]?>) -> Void)
    func getDrink(by id: String,completion: @escaping (Result<DrinkModel?>) -> Void)
    func fetchDrinks(completion: @escaping (Result<[DrinkModel]?>) -> Void)
    func saveDrink(newDrink: DrinkModel, completion: @escaping (VoidResult) -> Void)
    func removeDrink(by id: String, completion: @escaping (VoidResult) -> Void)
}
