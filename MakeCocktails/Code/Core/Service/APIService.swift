//
//  APIService.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import Foundation
import Alamofire

class APIService: ServicesProtocol {
    
    func getPopularDrinks(completion: @escaping (Result<[Drink]?>) -> Void) {
        guard let url = URL(string: baseURL+popular) else {return}
        
        Alamofire.request(url).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let drinks = try decoder.decode(ResultDrinks.self, from: data)
                    completion(Result.success(drinks.drinks))

                } catch let err {
                    print("Err", err)
                }
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    func getDrink(by id: String,completion: @escaping (Result<Drink?>) -> Void) {
        guard let url = URL(string: baseURL+lookup+id) else {return}
        
        Alamofire.request(url).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let drinks = try decoder.decode(ResultDrinks.self, from: data)
                    completion(Result.success(drinks.drinks.first))
                } catch let err {
                    print("Err", err)
                }
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
}
