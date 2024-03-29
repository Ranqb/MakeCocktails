//
//  FavoriteDrinkListRouter.swift
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

@objc protocol FavoriteDrinkListRoutingLogic
{
    func routeToDetails()
}

protocol FavoriteDrinkListDataPassing
{
  var dataStore: FavoriteDrinkListDataStore? { get }
}

class FavoriteDrinkListRouter: NSObject, FavoriteDrinkListRoutingLogic, FavoriteDrinkListDataPassing
{
  weak var viewController: FavoriteDrinkListViewController?
  var dataStore: FavoriteDrinkListDataStore?
  
    // MARK: Routing
    
    func routeToDetails() {
        let destination: DrinkDetailViewController = DrinkDetailViewController.fromStoryboard()
        guard let source = viewController,
            let sourceDataStore = dataStore,
            var destinationDataStore = destination.router?.dataStore else {
                assertionFailure("Could not instantiate required variables for routing")
                return
        }
        passDataToDetails(source: sourceDataStore, destination: &destinationDataStore)
        navigateToDetails(source: source, destination: destination)
    }
    
    //   MARK: Navigation
    
    private func navigateToDetails(source: UIViewController?, destination: UIViewController) {
        source?.navigationController?.pushViewController(destination, animated: true)
    }
    
    //   MARK: Passing data
    
    private func passDataToDetails(
        source: FavoriteDrinkListDataStore,
        destination: inout DrinkDetailDataStore
        ) {
        destination.drinkID = source.drinkID
        destination.isLocal = true
    }
}
