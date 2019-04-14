//
//  DrinksListInteractor.swift
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

protocol DrinksListBusinessLogic
{
  func doSomething(request: DrinksList.Something.Request)
}

protocol DrinksListDataStore
{
  //var name: String { get set }
}

class DrinksListInteractor: DrinksListBusinessLogic, DrinksListDataStore
{
  var presenter: DrinksListPresentationLogic?
  var worker: DrinksListWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: DrinksList.Something.Request)
  {
    worker = DrinksListWorker()
    worker?.doSomeWork()
    
    let response = DrinksList.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
