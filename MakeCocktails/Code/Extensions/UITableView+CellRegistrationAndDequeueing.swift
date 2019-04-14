//
//  UITableView+CellRegistrationAndDequeueing.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

extension UITableViewCell: ReusableView {}

extension UITableView {
    
    func register<CellType: UITableViewCell>(_: CellType.Type) {
        register(CellType.self, forCellReuseIdentifier: CellType.reuseIdentifier)
    }
    
    func register<CellType: UITableViewCell>(_: CellType.Type) where CellType: NibLoadable {
        let nib = UINib(nibName: CellType.nibName, bundle: Bundle(for: CellType.self))
        register(nib, forCellReuseIdentifier: CellType.reuseIdentifier)
    }
    
    func dequeue<CellType: UITableViewCell>(for indexPath: IndexPath) -> CellType {
        guard let cell = dequeueReusableCell(withIdentifier: CellType.reuseIdentifier,
                                             for: indexPath) as? CellType else {
                                                fatalError("Could not dequeue cell with identifier: \(CellType.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeue<CellType: UITableViewCell>() -> CellType {
        guard let reusableCell = dequeueReusableCell(withIdentifier: CellType.reuseIdentifier) else {
            return CellType(style: .default, reuseIdentifier: CellType.reuseIdentifier)
        }
        guard let cell = reusableCell as? CellType else {
            fatalError("Invalid cell type")
        }
        return cell
    }
    
    func cell<CellType: UITableViewCell>(at indexPath: IndexPath) -> CellType? {
        return cellForRow(at: indexPath) as? CellType
    }
}
