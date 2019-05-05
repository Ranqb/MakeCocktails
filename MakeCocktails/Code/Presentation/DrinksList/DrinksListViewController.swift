//
//  DrinksListViewController.swift
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

protocol DrinksListDisplayLogic: class {
    func displayDrinks(viewModel: DrinksList.FetchDrinks.ViewModel.Success)
    func displayError(viewModel: DrinksList.FetchDrinks.ViewModel.Failure)
}

class DrinksListViewController: ViewController
{
    var interactor: DrinksListBusinessLogic?
    var router: (NSObjectProtocol & DrinksListRoutingLogic & DrinksListDataPassing)?
//    private let searchController = UISearchController(searchResultsController: nil)
    private var searchDelayTimer: Timer?
    private var drinks: [DisplayedDrink] = []
    // MARK: IBOutlets
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
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
        let interactor = DrinksListInteractor()
        let presenter = DrinksListPresenter()
        let router = DrinksListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchDrinks()
        self.navigationItem.title = "Search drink"
        setupTableView()
//        setupSearchController()
        let api = APIService()
        api.getPopularDrinks { (result) in
            print(result)
        }
    }
    
    // MARK: Private Helpers
    
//    private func setupSearchController() {
//        searchController.searchBar.sizeToFit()
//        if #available(iOS 11.0, *) {
//            navigationItem.searchController = searchController
//            navigationItem.hidesSearchBarWhenScrolling = false
//        }
//        else {
//            collectionView.header = searchController.searchBar
//        }
//        searchController.searchBar.delegate = self
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.hidesNavigationBarDuringPresentation = false
//        definesPresentationContext = true
//    }
    
    private func setupTableView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DrinksListCell.self)
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func fetchDrinks()
    {
        displayLoading()
        let request = DrinksList.FetchDrinks.Request()
        interactor?.fetchDrinks(request: request)
    }
    

}

// MARK: DrinksListDisplayLogic
extension DrinksListViewController: DrinksListDisplayLogic {
    
    func displayDrinks(viewModel: DrinksList.FetchDrinks.ViewModel.Success)
    {
        displayContent()
        drinks = viewModel.displayedDrinks
        collectionView.reloadData()
    }
    
    func displayError(viewModel:  DrinksList.FetchDrinks.ViewModel.Failure) {
        displayContent()
        display(errorViewModel: viewModel.errorViewModel)
    }
}

// MARK: UICollectionView

extension DrinksListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var leftIndent: CGFloat{return CGFloat(10)}
    var rightIndent: CGFloat{return CGFloat(10)}
    var topAndBottomIndent: CGFloat{return CGFloat(10)}

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DrinksListCell = collectionView.dequeue(for: indexPath)
        cell.configure(drinks[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            cell.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let request = DrinksList.SelectDrink.Request(drinkID: drinks[indexPath.row].drinkID)
        interactor?.selectDrink(request: request)
        router.
//        let request = MainScreen.SelectAlbum.Request(albumID: albums[indexPath.row].albumID)
//        interactor?.selectAlbum(request: request)
//        router?.routeToDetails()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = leftIndent
            + rightIndent
            + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfItemsPerRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfItemsPerRow))
        
        return CGSize(width: size, height: size+(size/2))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: topAndBottomIndent, left: leftIndent, bottom: topAndBottomIndent, right: rightIndent)
    }
}

// MARK: UISearchBar
//
//extension DrinksListViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
////        searchDelayTimer?.invalidate()
////        searchDelayTimer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(searchArtists(sender:)), userInfo: searchText, repeats: false)
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
////        fetchArtists(with: nil)
//    }
//}
