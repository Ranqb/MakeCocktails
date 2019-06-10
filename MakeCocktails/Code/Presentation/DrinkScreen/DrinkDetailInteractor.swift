//
//  DrinkDetailInteractor.swift
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

protocol DrinkDetailBusinessLogic
{
    func fetchDrinkDetail(request: DrinkDetail.FetchDrink.Request)
    func fetchDrinksByIngredient(request: DrinkDetail.SelectIngredient.Request)
    func saveDrink(request: DrinkDetail.SaveDrink.Request)
    func removeDrink(request: DrinkDetail.RemoveDrink.Request)
}

protocol DrinkDetailDataStore
{
    var drinkID: String? { get set }
    var ingredient: String? {get set}
}

class DrinkDetailInteractor: DrinkDetailBusinessLogic, DrinkDetailDataStore
{
    // MARK: Properties
    var presenter: DrinkDetailPresentationLogic?
    private var apiWorker: DrinkDetailWorker = DrinkDetailWorker(service: APIService())
    private var dataBaseWorker: DrinkDetailWorker = DrinkDetailWorker(service: DataBaseService())

    // MARK: DrinkDetailDataStore
    
    var drinkID: String?
    var ingredient: String?
    
    // MARK: Do DrinkDetailBusinessLogic
    
    func fetchDrinkDetail(request: DrinkDetail.FetchDrink.Request) {
        guard let drinkID = drinkID else { return }
        apiWorker.getDrinkDetail(by: drinkID) { (result) in
            let response = DrinkDetail.FetchDrink.Response(result: result)
            self.presenter?.presentDrinkDetail(response: response)
        }
    }

    func fetchDrinksByIngredient(request: DrinkDetail.SelectIngredient.Request){
        ingredient = request.ingredient
    }
    
    func saveDrink(request: DrinkDetail.SaveDrink.Request){
        apiWorker.getDrinkDetail(by: request.drinkId) { (result) in
            let response = DrinkDetail.FetchDrink.Response(result: result)
            switch response.result {
            case .success(let drink):
                guard let drink = drink else { return }
                dataBaseWorker.addDrink(newDrink: drink) { (result) in
                    let response = DrinkDetail.SaveDrink.Response(result: result)
                    self.presenter?.presentSaveDrink(response: response)
                }
            case .failure(let error):
                self.presenter?.handleError(error)
            }
            
        }


    }
    func removeDrink(request: DrinkDetail.RemoveDrink.Request){
        dataBaseWorker.removeAlbum(withID: request.albumID) { (result) in
            let response = AlbumDetail.RemoveAlbum.Response(result: result)
            self.presenter?.presentRemovedAlbum(response: response)
        }
    }
}

