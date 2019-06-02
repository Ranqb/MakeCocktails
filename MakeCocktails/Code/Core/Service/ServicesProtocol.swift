//
//  ServicesProtocol.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import Foundation

protocol ServicesProtocol {
    func getPopularDrinks(completion: @escaping (Result<[Drink]?>) -> Void)
    func getDrinksByName(_ text: String, completion: @escaping (Result<[Drink]?>) -> Void)
    func getDrinksByIngredients(_ text: String, completion: @escaping (Result<[Drink]?>) -> Void)
    func getDrink(by id: String,completion: @escaping (Result<Drink?>) -> Void)
}
