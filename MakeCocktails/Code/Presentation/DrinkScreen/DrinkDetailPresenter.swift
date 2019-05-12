//
//  DrinkDetailPresenter.swift
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

protocol DrinkDetailPresentationLogic
{
    func presentDrinkDetail(response: DrinkDetail.FetchDrink.Response)
}

class DrinkDetailPresenter: DrinkDetailPresentationLogic
{
    
    //MARK: Properties
    
    weak var viewController: DrinkDetailDisplayLogic?
    
    // MARK: DrinkDetailPresentationLogic
    
    func presentDrinkDetail(response: DrinkDetail.FetchDrink.Response) {
        switch response.result {
        case .success(let drink):
            handleSuccessGetDrink(drink)
        case .failure(let error):
            handleError(error)
        }
    }
    
    // MARK: Private Helpers
    
    private func handleSuccessGetDrink(_ drink: Drink?) {
        guard let drink = drink else { return }
        guard let displayedDrink = DrinkDetail.FetchDrink.ViewModel.Success.DisplayedDrink(with: drink) else { return }
        let viewModel = DrinkDetail.FetchDrink.ViewModel.Success(displayedDrink: displayedDrink)
        viewController?.displayDrink(viewModel: viewModel)
    }
    
    private func handleError(_ error: Error) {
        let errorViewModel = ErrorViewModel(error: error)
        let viewModel = DrinkDetail.FetchDrink.ViewModel.Failure(errorViewModel: errorViewModel)
        viewController?.displayError(viewModel: viewModel)
    }

}

