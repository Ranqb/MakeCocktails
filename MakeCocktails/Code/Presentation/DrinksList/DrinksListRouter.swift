//
//  DrinksListRouter.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright (c) 2019 Andrey Nedov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol DrinksListRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol DrinksListDataPassing
{
  var dataStore: DrinksListDataStore? { get }
}

class DrinksListRouter: NSObject, DrinksListRoutingLogic, DrinksListDataPassing
{
  weak var viewController: DrinksListViewController?
  var dataStore: DrinksListDataStore?
  
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
        source: DrinksListDataStore,
        destination: inout DrinkDetailDataStore
        ) {
        destination.drinkID = source.drinkID
    }
}
