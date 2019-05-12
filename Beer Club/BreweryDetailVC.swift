//
//  BreweryDetailVC.swift
//  Beer Club
//
//  Created by Kent Franks on 12/12/18.
//  Copyright © 2018 Kent Franks. All rights reserved.
//

import UIKit

class BreweryDetailVC: UIViewController {
    
    @IBOutlet weak var breweryLogoImageView: UIImageView!
    @IBOutlet weak var breweryNameLabel: UILabel!
    @IBOutlet weak var breweryTourInfoLabel: UILabel!
    @IBOutlet weak var breweryDescriptionLabel: UILabel!
    
    let breweryList = BreweryList()
    var breweryIndex: Int = 0
    var brewery: Brewery = Brewery(id: 1, name: "Birdsong", logo: "birdsong.png", description: "Birdsong Brewing was founded in 2011 by a group of friends who share a love for both great beer and great people. We started with a five-gallon soup kettle and a vision inspired by some of our favorite craft breweries. The idea was simple: brew flavorful, unfiltered quality craft beer and bring that to Charlotte, NC.", tourTime: "Thursdays & Sundays at 6:30pm", addressLink: "http://maps.apple.com/?address=1016,North+Davidson+Street,Charlotte,North+Carolina")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brewery = breweryList.breweries[breweryIndex]
        self.title = brewery.name
        breweryNameLabel.text = brewery.name
        breweryTourInfoLabel.text = brewery.tourTime
        breweryDescriptionLabel.text = brewery.description
        breweryLogoImageView.image = UIImage(named: brewery.logo)
    }
    
    // MARK: - Actions
    @IBAction func addressAction(_ sender: Any) {
        if let url = URL(string: brewery.addressLink) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
}
