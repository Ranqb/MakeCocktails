//
//  FavoriteDrinkListModels.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 16/06/2019.
//  Copyright (c) 2019 Andrey Nedov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

typealias FavoriteDisplayedDrink = FavoriteDrinkList.FetchDrinks.ViewModel.Success.DisplayedDrink

enum FavoriteDrinkList
{
    // MARK: Use cases
    
    enum FetchDrinks
    {
        struct Request{}
        
        struct Response{
            let result: Result<[DrinkModel]?>
        }
        
        struct ViewModel{
            struct Success {
                struct DisplayedDrink {
                    let id: String
                    let name: String
                    let category: String
                    let alcoholic: String
                    let glass: String
                    let recipe: String
                    let imageURL: String
                    let ingredients: [DetailIngredient]
                    let isInStorage: Bool
                    
                    init(with drinkModel: DrinkModel) {
                        id = drinkModel.id ?? ""
                        name = drinkModel.name ?? ""
                        category = drinkModel.category ?? ""
                        alcoholic = drinkModel.alcoholic ?? ""
                        glass = drinkModel.glass ?? ""
                        recipe = drinkModel.recipe ?? ""
                        imageURL = drinkModel.imageURL ?? ""
                        
                        let ingredientsList: [String] = [drinkModel.ingredient1 ?? "",
                                                         drinkModel.ingredient2 ?? "",
                                                         drinkModel.ingredient3 ?? "",
                                                         drinkModel.ingredient4 ?? "",
                                                         drinkModel.ingredient5 ?? "",
                                                         drinkModel.ingredient6 ?? "",
                                                         drinkModel.ingredient7 ?? "",
                                                         drinkModel.ingredient8 ?? "",
                                                         drinkModel.ingredient9 ?? "",
                                                         drinkModel.ingredient10 ?? "",
                                                         drinkModel.ingredient11 ?? "",
                                                         drinkModel.ingredient12 ?? "",
                                                         drinkModel.ingredient13 ?? "",
                                                         drinkModel.ingredient14 ?? "",
                                                         drinkModel.ingredient15 ?? ""]
                        
                        let measuresList: [String] = [drinkModel.measure1 ?? "",
                                                      drinkModel.measure2 ?? "",
                                                      drinkModel.measure3 ?? "",
                                                      drinkModel.measure4 ?? "",
                                                      drinkModel.measure5 ?? "",
                                                      drinkModel.measure6 ?? "",
                                                      drinkModel.measure7 ?? "",
                                                      drinkModel.measure8 ?? "",
                                                      drinkModel.measure9 ?? "",
                                                      drinkModel.measure10 ?? "",
                                                      drinkModel.measure11 ?? "",
                                                      drinkModel.measure12 ?? "",
                                                      drinkModel.measure13 ?? "",
                                                      drinkModel.measure14 ?? "",
                                                      drinkModel.measure15 ?? ""]
                        
                        var tempIngredients = [DetailIngredient]()
                        
                        for i in 0..<15{
                            let ingredient = ingredientsList[i] as String
                            let measure = measuresList[i] as String
                            if ingredient.count > 0 && measure.count > 0{
                                tempIngredients.append(DetailIngredient(with: ingredient, ingredientMeasure: measure)!)
                            }
                        }
                        ingredients = tempIngredients
                        isInStorage = drinkModel.isInStorage
                    }
                }
                let displayedDrinks: [DisplayedDrink]
            }
            struct Failure {
                let errorViewModel: ErrorViewModel
            }
        }
        
        
    }
    enum SelectDrink {
        struct Request {
            let drinkID: String
        }
        struct Response {}
        struct ViewModel {}
    }
    enum RemoveDrink {
        struct Request {
            let drinkId: String
        }
        struct Response {
            let result: VoidResult
        }
        struct ViewModel {}
    }
}

