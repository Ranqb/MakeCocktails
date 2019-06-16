//
//  DrinkDetailWorker.swift
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

class DrinkDetailWorker
{
    // MARK: Properties
    
    var service: ServicesProtocol
    
    // MARK: Initialization
    
    init(service: ServicesProtocol) {
        self.service = service
    }
    
    // MARK: AlbumDetailBusinessLogic
    
    func getDrinkDetail(by id: String, completion: @escaping (Result<DrinkModel?>) -> Void) {
        service.getDrink(by: id) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    func saveDrink(newDrink: DrinkModel, completion: @escaping (VoidResult) -> Void) {
        service.saveDrink(newDrink: newDrink) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
    func removeDrink(by id: String, completion: @escaping (VoidResult) -> Void) {
        service.removeDrink(by: id) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}

