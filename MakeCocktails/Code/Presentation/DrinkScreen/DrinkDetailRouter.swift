//
//  DrinkDetailRouter.swift
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

@objc protocol DrinkDetailRoutingLogic
{
    func routeToDrinks()
}

protocol DrinkDetailDataPassing
{
    var dataStore: DrinkDetailDataStore? { get }
}

class DrinkDetailRouter: NSObject, DrinkDetailRoutingLogic, DrinkDetailDataPassing
{
    weak var viewController: DrinkDetailViewController?
    var dataStore: DrinkDetailDataStore?
    
    // MARK: Routing
    
    func routeToDrinks() {
        let destination: DrinksListViewController = DrinksListViewController.fromStoryboard()
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
        source: DrinkDetailDataStore,
        destination: inout DrinksListDataStore
        ) {
        destination.ingredient = source.ingredient
    }
}

