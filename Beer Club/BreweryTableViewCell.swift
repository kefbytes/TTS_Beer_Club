//
//  BreweryTableViewCell.swift
//  Beer Club
//
//  Created by Kent Franks on 12/17/18.
//  Copyright © 2018 Kent Franks. All rights reserved.
//

import UIKit

class BreweryTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var breweryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
