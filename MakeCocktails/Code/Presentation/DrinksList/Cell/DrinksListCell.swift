//
//  DrinksListCell.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 23/03/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit
import AlamofireImage

class DrinksListCell: UICollectionViewCell, NibLoadable {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var drinkCategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.addShadow()
        self.layer.roundCorners(radius: cornerRadius)
        self.clipsToBounds = true
        self.backgroundImageView.contentMode = .scaleAspectFit;
        
    }
    func configure(_ drink: DisplayedDrink) {
        drinkImageView.af_setImage(withURL: URL(string: drink.imageURL)!, placeholderImage: nil, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .noTransition, runImageTransitionIfCached: true, completion: nil)
        backgroundImageView.af_setImage(withURL: URL(string: drink.imageURL)!)
        drinkNameLabel.text = drink.drinkName
        drinkCategoryLabel.text = drink.category
    }
    
    
}
