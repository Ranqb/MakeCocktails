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
    
    func configure(withImageURL url: String?, name: String?, category: String?){
        nameLabel.text = name
        categoryLabel.text = category
        guard let url = url else { return }
        drinkImageView.af_setImage(withURL: URL(string: url)!)
    }
    
}

