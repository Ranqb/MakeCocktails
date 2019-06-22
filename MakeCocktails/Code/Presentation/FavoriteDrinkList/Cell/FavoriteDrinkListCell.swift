//
//  FavoriteDrinkListCell.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 16/06/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

class FavoriteDrinkListCell: UITableViewCell, NibLoadable {

    // MARK: IBOutlets
    
    @IBOutlet var drinkImageView: UIImageView!
    @IBOutlet var drinkNameLabel: UILabel!
    @IBOutlet var drinkIngredientsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = defaultBackgroundColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.7
        self.drinkImageView.layer.cornerRadius = cornerRadius
    }
    
    func configure(_ drink: FavoriteDisplayedDrink) {
        drinkImageView.af_setImage(withURL: URL(string: drink.imageURL)!)
        drinkNameLabel.text = drink.name
        drinkIngredientsLabel.text = drink.ingredients.map({$0.name}).joined(separator: ", ")
    }

}
