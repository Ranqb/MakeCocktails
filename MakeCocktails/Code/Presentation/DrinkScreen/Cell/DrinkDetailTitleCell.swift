//
//  DrinkTitleCell.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 12/05/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

class DrinkDetailTitleCell: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(_ drink: DetailDrink?){
        guard let drink = drink else {return}
        nameLabel.text = drink.name
        categoryLabel.text = drink.category
        drinkImageView.af_setImage(withURL: URL(string: drink.imageURL)!)
    }
    
}

