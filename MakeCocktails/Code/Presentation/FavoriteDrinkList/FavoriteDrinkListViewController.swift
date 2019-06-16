//
//  FavoriteDrinkListViewController.swift
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

protocol FavoriteDrinkListDisplayLogic: class
{
    func displayDrinks(viewModel: FavoriteDrinkList.FetchDrinks.ViewModel.Success)
    func displayError(viewModel: FavoriteDrinkList.FetchDrinks.ViewModel.Failure)
}

class FavoriteDrinkListViewController: ViewController
{
    var interactor: FavoriteDrinkListBusinessLogic?
    var router: (NSObjectProtocol & FavoriteDrinkListRoutingLogic & FavoriteDrinkListDataPassing)?
    private var searchDelayTimer: Timer?
    private var drinks: [FavoriteDisplayedDrink] = []
    
    // MARK: IBOutlets
    
    @IBOutlet var tableView: UITableView!
    
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
        let interactor = FavoriteDrinkListInteractor()
        let presenter = FavoriteDrinkListPresenter()
        let router = FavoriteDrinkListRouter()
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
        self.navigationItem.title = "Favorite"
        fetchDrinks(with: FavoriteDrinkList.FetchDrinks.default)
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDrinks(with: FavoriteDrinkList.FetchDrinks.default)
    }
    
    // MARK: Private Helpers
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FavoriteDrinkListCell.self)
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func fetchDrinks(with text: String?)
    {
        guard let text = text else {return}
        displayLoading()
        let request = FavoriteDrinkList.FetchDrinks.Request(searchText: text)
        interactor?.fetchDrinks(request: request)
    }
    
    @objc fileprivate func searchDrinks(sender: Timer) {
        fetchDrinks(with: sender.userInfo as? String)
    }
    
}

// MARK: FavoriteDrinkListDisplayLogic
extension FavoriteDrinkListViewController: FavoriteDrinkListDisplayLogic {
    
    func displayDrinks(viewModel: FavoriteDrinkList.FetchDrinks.ViewModel.Success)
    {
        displayContent()
        drinks = viewModel.displayedDrinks
        tableView.reloadData()
    }
    func displayError(viewModel: FavoriteDrinkList.FetchDrinks.ViewModel.Failure){
        displayContent()
        display(errorViewModel: viewModel.errorViewModel)
    }
}

// MARK: UICollectionView

extension FavoriteDrinkListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FavoriteDrinkListCell = tableView.dequeue(for: indexPath)
        cell.configure(drinks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let request = FavoriteDrinkList.SelectDrink.Request(drinkID: drinks[indexPath.row].id)
        interactor?.selectDrink(request: request)
        router?.routeToDetails()
    }

}