//
//  NibLoadable.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//
import UIKit


protocol NibLoadable: class {}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: Self.self)
    }
    
    static func fromNib(_ bundle: Bundle? = nil) -> Self {
        let nib = UINib(nibName: nibName, bundle: bundle)
        // TODO: Check for more than 1 view.
        guard let view = nib.instantiate(withOwner: nil, options: nil)[0] as? Self else {
            fatalError("Could not instantiate a view of type \(Self.self) from nib \(nibName)")
        }
        return view
    }
}
