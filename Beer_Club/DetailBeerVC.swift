//
//  DetailBeerVC.swift
//  Beer Club
//
//  Created by Franks, Kent on 7/17/17.
//  Copyright © 2017 KefBytes. All rights reserved.
//

import UIKit

class DetailBeerVC: UIViewController {

    @IBOutlet weak var breweryName: UILabel!
    @IBOutlet weak var tourInfo: UILabel!
    @IBOutlet weak var breweryDesc: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    var breweryIndex: Int = 1
    var breweryNameString = ""
    let breweryList = BreweryList()
    var brewery: Brewery = Brewery(id: 1, name: "Birdsong", logo: "birdsong.png", description: "Birdsong Brewing was founded in 2011 by a group of friends who share a love for both great beer and great people. We started with a five-gallon soup kettle and a vision inspired by some of our favorite craft breweries. The idea was simple: brew flavorful, unfiltered quality craft beer and bring that to Charlotte, NC.", tourTime: "Thursdays at 6:30pm", addressLink: "http://maps.apple.com/?address=1016,North+Davidson+Street,Charlotte,North+Carolina")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brewery = breweryList.breweries[breweryIndex]
        navigationItem.title = breweryNameString
        breweryName.text = brewery.name
        tourInfo.text = brewery.tourTime
        breweryDesc.text = brewery.description
        logoImage.image = UIImage(named: brewery.logo)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func addressAction(_ sender: Any) {
        if let url = URL(string: brewery.addressLink) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
