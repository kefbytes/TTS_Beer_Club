//
//  BreweryCell.swift
//  Beer Club
//
//  Created by Franks, Kent on 7/24/17.
//  Copyright © 2017 KefBytes. All rights reserved.
//

import UIKit

class BreweryCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var breweryNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
