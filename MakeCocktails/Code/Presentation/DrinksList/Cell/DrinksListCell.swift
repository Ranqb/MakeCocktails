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
    
    private var shadowLayer: CAShapeLayer!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var drinkCategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = cornerRadius
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowOffset = .zero
        backView.layer.shadowRadius = 3.0
        backView.layer.shadowOpacity = 0.7
        self.drinkImageView.layer.cornerRadius = self.drinkImageView.frame.size.width / 2
    }

    func configure(_ drink: DisplayedDrink) {
        drinkImageView.af_setImage(withURL: URL(string: drink.imageURL)!, placeholderImage: nil, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .noTransition, runImageTransitionIfCached: true, completion: nil)
        drinkNameLabel.text = drink.drinkName
        drinkCategoryLabel.text = drink.category
    }
    
    
}
