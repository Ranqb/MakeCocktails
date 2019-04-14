//
//  UIViewController+Alerts.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

extension UIViewController {
    func displayOKAlert(withTitle title: String, message: String, okHandler: (() -> Void)? = nil) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
            okHandler?()
        }
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    
    func display(error: Error, okHandler: (() -> Void)? = nil) {
        let title = NSLocalizedString("Error", comment: "")
        let message = error.localizedDescription
        displayOKAlert(withTitle: title, message: message, okHandler: okHandler)
    }
    
    func display(errorViewModel: ErrorViewModel, okHandler: (() -> Void)? = nil) {
        let title = errorViewModel.title
        let message = errorViewModel.message
        displayOKAlert(withTitle: title, message: message, okHandler: okHandler)
    }
}
