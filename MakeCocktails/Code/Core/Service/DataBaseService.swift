//
//  DataBaseService.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit
import CoreData

class DataBaseService: ServicesProtocol {
    
    // MARK: Properties
    
    private let backgroundContext: NSManagedObjectContext!
    
    // MARK: Initialization
    
    init(context: NSManagedObjectContext) {
        backgroundContext = context
    }
    
    convenience init() {
        //Use the default container for production environment
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Can not get shared app delegate")
        }
        self.init(context: appDelegate.managedObjectContext)
    }
    
    func getIngredientsList(completion: @escaping (Result<[String]?>) -> Void){
//        backgroundContext.perform {
//            do {
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Drink")
//                guard let results = try self.backgroundContext.fetch(fetchRequest) as? [Drink] else { return }
//                var drinks = results.map { $0.fetch() }
//                drinks = drinks.sorted(by: { $0.name?.lowercased() ?? "" < $1.name?.lowercased() ?? "" })
//                completion(Result.success(drinks))
//            } catch {
//                completion(Result.failure(error))
//            }
//        }
    }

    func getDrink(by id: String,completion: @escaping (Result<DrinkModel?>) -> Void){
        backgroundContext.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Drink")
                let predicate = NSPredicate(format: "drinkID == %@", id)
                fetchRequest.predicate = predicate
                
                guard let results = try self.backgroundContext.fetch(fetchRequest) as? [Drink] else { return }
                let drinks = results.map { $0.fetch() }
                if let drink = drinks.first {
                    completion(Result.success(drink))
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: nil)
                    completion(Result.failure(error))
                }
            } catch {
                completion(Result.failure(error))
            }
        }
    }
    
    func fetchDrinks(completion: @escaping (Result<[DrinkModel]?>) -> Void){
        backgroundContext.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Drink")
                guard let results = try self.backgroundContext.fetch(fetchRequest) as? [Drink] else { return }
                var drinks = results.map { $0.fetch() }
                drinks = drinks.sorted(by: { $0.name?.lowercased() ?? "" < $1.name?.lowercased() ?? "" })
                completion(Result.success(drinks))
            } catch {
                completion(Result.failure(error))
            }
        }
    }
    
    func saveDrink(newDrink: DrinkModel, completion: @escaping (VoidResult) -> Void){
        backgroundContext.perform {
            do {
                let managedDrink = NSEntityDescription.insertNewObject(forEntityName: "Drink",
                                                                       into: self.backgroundContext) as! Drink
                managedDrink.add(newDrink: newDrink)
                try self.backgroundContext.save()
                completion(Result.success(Void()))
            } catch {
                completion(Result.failure(error))
            }
        }
    }
    func removeDrink(by id: String, completion: @escaping (VoidResult) -> Void){
        backgroundContext.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Drink")
                let predicate = NSPredicate(format: "drinkID == %@", id)
                fetchRequest.predicate = predicate
                guard let results = try self.backgroundContext.fetch(fetchRequest) as? [Drink] else { return }
                for object in results {
                    self.backgroundContext.delete(object)
                }
                try self.backgroundContext.save()
                completion(Result.success(Void()))
            } catch {
                completion(Result.failure(error))
            }
        }
    }
    
    func getPopularDrinks(completion: @escaping (Result<[DrinkModel]?>) -> Void){
        assertionFailure("Not implemented")
    }
    func getDrinksByName(_ text: String, completion: @escaping (Result<[DrinkModel]?>) -> Void){
        assertionFailure("Not implemented")
    }
    func getDrinksByIngredients(_ text: String, completion: @escaping (Result<[DrinkModel]?>) -> Void){
        assertionFailure("Not implemented")
    }
    
    func isDrinkExistInCoreData(drinkID: String) -> Bool {
        var results: [NSManagedObject] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Drink")
        let predicate = NSPredicate(format: "drinkID == %@", drinkID)
        fetchRequest.predicate = predicate
        do {
            results = try backgroundContext.fetch(fetchRequest) as! [NSManagedObject]
        } catch {
            print("error executing fetch request: \(error)")
        }
        return results.count > 0
    }
}
