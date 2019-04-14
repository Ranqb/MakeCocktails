//
//  ErrorViewModel.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import Foundation

struct ErrorViewModel {
    
    // MARK: Properties
    
    let title: String
    let message: String
    
    // MARK: Initialization
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
    
    init(error: Error) {
        self.title = NSLocalizedString("Error", comment: "")
        self.message = error.localizedDescription
    }
}
