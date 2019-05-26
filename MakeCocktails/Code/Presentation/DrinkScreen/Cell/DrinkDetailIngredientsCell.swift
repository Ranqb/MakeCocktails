//
//  DrinkDetailIngredientsCell.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 12/05/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

class DrinkDetailIngredientsCell: UITableViewCell, NibLoadable {

    @IBOutlet weak var ingredientImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ingredientImageView.layer.cornerRadius = 10;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ ingredient: DetailIngredient?) {
        guard let ingredient = ingredient else {return}
        ingredientImageView.image = UIImage.init(named: ingredient.name) ?? UIImage.init(named: "noCocktail")
        nameLabel.text = ingredient.name
        volumeLabel.text = ingredient.measure
    }

}
