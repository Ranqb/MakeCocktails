//
//  UIViewController+Storyboard.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

extension UIViewController {
    static func fromStoryboard<ViewController: UIViewController>() -> ViewController {
        let storyboardName = String(describing: ViewController.self)
        let bundle = Bundle(for: ViewController.self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let controller = storyboard.instantiateInitialViewController() as? ViewController else {
            fatalError("Could not create a view controller of type '\(ViewController.self)' from storyboard")
        }
        return controller
    }
}

//extension UIViewController {
//    static func fromStoryboard<ViewController: UIViewController>() -> ViewController {
//        let storyboardName = String(describing: ViewController.self)
//        let bundle = Bundle(for: ViewController.self)
//        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
//        guard let controller = storyboard.instantiateInitialViewController() as? ViewController else {
//            
//            guard let nav = storyboard.instantiateInitialViewController() as? UINavigationController else {
//                fatalError("Could not create a view controller of type '\(UINavigationController.self)' from storyboard")
//            }
//            if let vc = nav.viewControllers.first as? ViewController{
//                return nav
//            }else {
//                fatalError("Could not create a view controller of type '\(ViewController.self)' from storyboard")
//            }
//            
//            fatalError("Could not create a view controller of type '\(ViewController.self)' from storyboard")
//        }
//        return controller
//    }
//}
