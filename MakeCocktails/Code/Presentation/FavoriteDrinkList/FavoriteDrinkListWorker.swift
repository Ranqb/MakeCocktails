//
//  FavoriteDrinkListWorker.swift
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

class FavoriteDrinkListWorker
{
    // MARK: Properties
    
    var service: ServicesProtocol
    
    // MARK: Initialization
    
    init(service: ServicesProtocol) {
        self.service = service
    }
    
    // MARK: MainScreenBusinessLogic
    
    func getDrinks(completion: @escaping (Result<[DrinkModel]?>) -> Void) {
        service.fetchDrinks { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
