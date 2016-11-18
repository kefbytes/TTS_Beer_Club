//
//  DetailedBreweryVC.swift
//  Beer_Club
//
//  Created by Franks, Kent on 11/9/16.
//  Copyright © 2016 Franks, Kent. All rights reserved.
//

import UIKit

class DetailedBreweryVC: UIViewController {

    @IBOutlet weak var breweryNameLabel: UILabel!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var breweryDescriptionLabel: UILabel!
    
    @IBOutlet weak var tourInfoLabel: UILabel!
    
    let breweryList = BreweryList()
    var brewery:Brewery?
    var breweryIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brewery = breweryList.breweries[breweryIndex]
        setupUI()
    }

    func setupUI() {
        self.title = brewery?.nickname
        breweryNameLabel.text = brewery?.name
        breweryDescriptionLabel.text = brewery?.description
        tourInfoLabel.text = brewery?.tourTime
        logoImage.image = UIImage(named: (brewery?.logo)!)
    }
    
    
    
    
    
    @IBAction func mapsAction(_ sender: Any) {
        if let url = NSURL(string: (brewery?.addressLink)!) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
