//
//  UICollectionView+CellRegistrationAndDequeueing.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 22/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

extension UICollectionViewCell: ReusableView {}

extension UICollectionView {
    func register<CellType: UICollectionViewCell>(_: CellType.Type) where CellType: NibLoadable {
        let nib = UINib(nibName: CellType.nibName, bundle: Bundle(for: CellType.self))
        register(nib, forCellWithReuseIdentifier: CellType.reuseIdentifier)
    }
    
    func dequeue<CellType: UICollectionViewCell>(for indexPath: IndexPath) -> CellType {
        guard
            let cell = dequeueReusableCell(withReuseIdentifier: CellType.reuseIdentifier, for: indexPath) as? CellType
            else {
                fatalError("Could not dequeue cell with identifier: \(CellType.reuseIdentifier)")
        }
        return cell
    }
}
