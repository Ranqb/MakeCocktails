//
//  DrinkDetailViewController.swift
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

protocol DrinkDetailDisplayLogic: class
{
    func displayDrink(viewModel: DrinkDetail.FetchDrink.ViewModel.Success)
    func displayError(viewModel: DrinkDetail.FetchDrink.ViewModel.Failure)
    
}

class DrinkDetailViewController: ViewController
{
    //MARK: IBOutlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: Properties
    
    var interactor: DrinkDetailBusinessLogic?
    var router: (NSObjectProtocol & DrinkDetailRoutingLogic & DrinkDetailDataPassing)?
    
    private var drink: DetailDrink?

    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = DrinkDetailInteractor()
        let presenter = DrinkDetailPresenter()
        let router = DrinkDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupTableView()
        getDrink()
    }
    
    // MARK: Private Helpers
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DrinkDetailTitleCell.self)
        tableView.register(DrinkDetailIngredientsCell.self)
        tableView.register(DrinkDetailDescriptionCell.self)
        tableView.tableFooterView = UIView()
    }
    
    private func getDrink() {
        displayLoading()
        let request = DrinkDetail.FetchDrink.Request()
        interactor?.fetchDrinkDetail(request: request)
    }
    
}

extension DrinkDetailViewController: DrinkDetailDisplayLogic{
    func displayDrink(viewModel: DrinkDetail.FetchDrink.ViewModel.Success) {
        displayContent()
        drink = viewModel.displayedDrink
        title = drink?.name
        tableView.reloadData()
    }
    
    func displayError(viewModel: DrinkDetail.FetchDrink.ViewModel.Failure) {
        displayContent()
        display(errorViewModel: viewModel.errorViewModel)
    }
}

extension DrinkDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drink?.fieldsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: DrinkDetailTitleCell = tableView.dequeue(for: indexPath)
            cell.configure(drink)
            return cell
        }else if let count = drink?.fieldsCount, indexPath.row == count - 1{
            let cell: DrinkDetailDescriptionCell = tableView.dequeue(for: indexPath)
            cell.configure(drink)
            return cell
        }else{
            let cell: DrinkDetailIngredientsCell = tableView.dequeue(for: indexPath)
            cell.configure(drink?.ingredients[indexPath.row - 1])
            return cell
        }
    }
    
    
}

