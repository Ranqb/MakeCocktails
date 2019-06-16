//
//  Constants.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

public typealias VoidResult = Result<Void>

let baseURL = "https://www.thecocktaildb.com/api/json/v2/1/"
let ingredientsList = "list.php?i=list"
let popular = "popular.php"
let search = "search.php?s="
let filter = "filter.php?i="
let alcoholicDrink = "filter.php?a=Alcoholic"
let nonAlcoholicDrink = "filter.php?a=Non_Alcoholic"
let lookup = "lookup.php?i="
let catories = "list.php?c=list"

let delay = 0.5

let cornerRadius = CGFloat(8)
let statusBarStyle: UIStatusBarStyle = .default
let navBackgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
let navTextColor = #colorLiteral(red: 0.05490196078, green: 0.1333333333, blue: 0.2392156863, alpha: 1)
