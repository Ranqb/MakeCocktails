//
//  DrinkDetailModels.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 04/05/2019.
//  Copyright (c) 2019 Andrey Nedov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum DrinkDetail
{
    // MARK: Use cases
    
    enum FetchDrink
    {
        struct Request{}
        
        struct Response{
            let result: Result<Drink?>
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
                    let ingredient1: String
                    let ingredient2: String
                    let ingredient3: String
                    let ingredient4: String
                    let ingredient5: String
                    let ingredient6: String
                    let ingredient7: String
                    let ingredient8: String
                    let ingredient9: String
                    let ingredient10: String
                    let ingredient11: String
                    let ingredient12: String
                    let ingredient13: String
                    let ingredient14: String
                    let ingredient15: String
                    let measure1: String
                    let measure2: String
                    let measure3: String
                    let measure4: String
                    let measure5: String
                    let measure6: String
                    let measure7: String
                    let measure8: String
                    let measure9: String
                    let measure10: String
                    let measure11: String
                    let measure12: String
                    let measure13: String
                    let measure14: String
                    let measure15: String

                    init(with drinkModel: Drink) {
                        id = drinkModel.id ?? ""
                        name = drinkModel.name ?? ""
                        category = drinkModel.category ?? ""
                        alcoholic = drinkModel.alcoholic ?? ""
                        glass = drinkModel.glass ?? ""
                        recipe = drinkModel.recipe ?? ""
                        imageURL = drinkModel.imageURL ?? ""
                        ingredient1 = drinkModel.ingredient1 ?? ""
                        ingredient2 = drinkModel.ingredient2 ?? ""
                        ingredient3 = drinkModel.ingredient3 ?? ""
                        ingredient4 = drinkModel.ingredient4 ?? ""
                        ingredient5 = drinkModel.ingredient5 ?? ""
                        ingredient6 = drinkModel.ingredient6 ?? ""
                        ingredient7 = drinkModel.ingredient7 ?? ""
                        ingredient8 = drinkModel.ingredient8 ?? ""
                        ingredient9 = drinkModel.ingredient9 ?? ""
                        ingredient10 = drinkModel.ingredient10 ?? ""
                        ingredient11 = drinkModel.ingredient11 ?? ""
                        ingredient12 = drinkModel.ingredient12 ?? ""
                        ingredient13 = drinkModel.ingredient13 ?? ""
                        ingredient14 = drinkModel.ingredient14 ?? ""
                        ingredient15 = drinkModel.ingredient15 ?? ""
                        measure1 = drinkModel.measure1 ?? ""
                        measure2 = drinkModel.measure2 ?? ""
                        measure3 = drinkModel.measure3 ?? ""
                        measure4 = drinkModel.measure4 ?? ""
                        measure5 = drinkModel.measure5 ?? ""
                        measure6 = drinkModel.measure6 ?? ""
                        measure7 = drinkModel.measure7 ?? ""
                        measure8 = drinkModel.measure8 ?? ""
                        measure9 = drinkModel.measure9 ?? ""
                        measure10 = drinkModel.measure10 ?? ""
                        measure11 = drinkModel.measure11 ?? ""
                        measure12 = drinkModel.measure12 ?? ""
                        measure13 = drinkModel.measure13 ?? ""
                        measure14 = drinkModel.measure14 ?? ""
                        measure15 = drinkModel.measure15 ?? ""
                    }
                }
                let displayedDrink: DisplayedDrink
            }
            struct Failure {
                let errorViewModel: ErrorViewModel
            }
        }
    }
}
