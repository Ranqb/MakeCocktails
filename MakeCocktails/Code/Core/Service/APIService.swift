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
    
    func getIngredientsList(completion: @escaping (Result<[String]?>) -> Void) {
        guard let url = URL(string: baseURL+ingredientsList) else {return}

        Alamofire.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                var result: [String] = [];
                if data is NSDictionary{
                    guard let array = (data as! NSDictionary).object(forKey: "drinks") else {return}
                    if array is NSArray{
                        for element in array as! NSArray{
                            if element is NSDictionary{
                                result.append((element as! NSDictionary).object(forKey: "strIngredient1") as! String)
                            }
                        }
                    }
                }
                completion(Result.success(result))

            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    func getPopularDrinks(completion: @escaping (Result<[DrinkModel]?>) -> Void) {
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
    
    func getDrinksByName(_ text: String, completion: @escaping (Result<[DrinkModel]?>) -> Void) {
        let searchName = text.replacingOccurrences(of: " ", with: "_")
        guard let url = URL(string: baseURL+search+searchName) else {return}
        
        Alamofire.request(url).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let drinks = try decoder.decode(ResultDrinks.self, from: data)
                    completion(Result.success(drinks.drinks))
                    
                } catch let err {
                    print("Err", err)
                    completion(Result.success([]))
                }
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    func getDrinksByIngredients(_ text: String, completion: @escaping (Result<[DrinkModel]?>) -> Void) {
        var ingredients = text.replacingOccurrences(of: " ,", with: ",")
        ingredients = ingredients.replacingOccurrences(of: ", ", with: ",")
        ingredients = ingredients.replacingOccurrences(of: " ", with: "_")
        
        guard let url = URL(string: baseURL+filter+ingredients) else {return}
        
        Alamofire.request(url).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let drinks = try decoder.decode(ResultDrinks.self, from: data)
                    completion(Result.success(drinks.drinks))
                    
                } catch let err {
                    print("Err", err)
                    completion(Result.success([]))
                }
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    func getDrink(by id: String, completion: @escaping (Result<DrinkModel?>) -> Void) {
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
