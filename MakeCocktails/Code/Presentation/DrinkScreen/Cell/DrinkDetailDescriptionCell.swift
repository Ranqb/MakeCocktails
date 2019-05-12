//
//  DrinkDetailDescriptionCell.swift
//  MakeCocktails
//
//  Created by Andrey Nedov on 12/05/2019.
//  Copyright © 2019 Andrey Nedov. All rights reserved.
//

import UIKit

class DrinkDetailDescriptionCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with title: String, description: String){
        titleLabel.text = title
        descriptionLabel.text = description
    }

}
