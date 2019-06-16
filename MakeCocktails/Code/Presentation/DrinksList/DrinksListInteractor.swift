//
//  DrinksListInteractor.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright (c) 2019 Andrey Nedov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DrinksListBusinessLogic
{
    func fetchDrinks(request: DrinksList.FetchDrinks.Request)
    func selectDrink(request: DrinksList.SelectDrink.Request)
    func ingredientIsNotEmpty() -> Bool
}

protocol DrinksListDataStore
{
    var drinkID: String? {get set}
    var ingredient: String? {get set}
}

class DrinksListInteractor: DrinksListBusinessLogic, DrinksListDataStore
{
    var drinkID: String?
    var ingredient: String?
    
    var presenter: DrinksListPresentationLogic?
    private var apiWorker: DrinksListWorker = DrinksListWorker(service: APIService())
    private var getIngredientsList: [String] = []

    func fetchDrinks(request: DrinksList.FetchDrinks.Request) {
        var searchText = request.searchText
        if let ingredient = ingredient{
            searchText = ingredient
        }else{
            if getIngredientsList.isEmpty {
                apiWorker.getIngredientsList { (result) in
                    switch result {
                    case .success(let ingredients):
                        self.getIngredientsList = ingredients ?? []
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }

        if !searchText.isEmpty {
            if searchText.contains(","){
                apiWorker.getDrinksByIngredients(searchText) { (result) in
                    let response = DrinksList.FetchDrinks.Response(result: result)
                    self.presenter?.presentDrinks(response: response)
                }
            }else if ((getIngredientsList.contains(searchText)) || !(ingredient?.isEmpty ?? true)) {
                apiWorker.getDrinksByIngredients(searchText) { (result) in
                    let response = DrinksList.FetchDrinks.Response(result: result)
                    self.presenter?.presentDrinks(response: response)
                }
            }else{
                apiWorker.getDrinksByName(searchText) { (result) in
                    let response = DrinksList.FetchDrinks.Response(result: result)
                    self.presenter?.presentDrinks(response: response)
                }
            }
        }else{
            apiWorker.getPopularDrinks { (result) in
                let response = DrinksList.FetchDrinks.Response(result: result)
                self.presenter?.presentDrinks(response: response)
            }
        }
    }
    
    func selectDrink(request: DrinksList.SelectDrink.Request) {
        drinkID = request.drinkID
    }
    
    func ingredientIsNotEmpty() -> Bool {
        if let ingredient = ingredient{
            return !ingredient.isEmpty
        }
        return false
    }
}

