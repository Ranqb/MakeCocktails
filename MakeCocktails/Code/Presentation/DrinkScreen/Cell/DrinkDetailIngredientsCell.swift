//
//  DrinkDetailIngredientsCell.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 12/05/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

class DrinkDetailIngredientsCell: UITableViewCell {

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
    
    func configure(with imageName: String, name: String, volume: String) {
        ingredientImageView.image = UIImage.init(named: imageName)
        nameLabel.text = name
        volumeLabel.text = volume
    }

}
