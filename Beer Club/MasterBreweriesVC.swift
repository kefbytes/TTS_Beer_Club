//
//  MasterBreweriesVC.swift
//  Beer Club
//
//  Created by Kent Franks on 12/12/18.
//  Copyright © 2018 Kent Franks. All rights reserved.
//

import UIKit

enum FoundState {
    case found
    case lost
}

class MasterBreweriesVC: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var findItButton: UIButton!
    @IBOutlet weak var bridsongBreweryView: UIView!
    @IBOutlet weak var nodaBreweryView: UIView!
    @IBOutlet weak var ombBreweryView: UIView!
    @IBOutlet weak var tripleCBreweryView: UIView!
    
    let breweries = BreweryList().breweries
    var isFound = false
    let buttonText = "Find It!"
    var state: FoundState = .lost
    let breweryDetailSegue = "BreweryDetailSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Master Breweries"
        
        let breweryViews = [bridsongBreweryView, nodaBreweryView, ombBreweryView, tripleCBreweryView]
        
        for index in 0..<breweryViews.count {
            let brewery = breweries[index]
            for subview in breweryViews[index]?.subviews ?? [] { // [Subviews] = imageView & label
                if let label = subview as? UILabel {
                    label.text = brewery.name
                }
                if let logo = subview as? UIImageView {
                    logo.image = UIImage(named: brewery.logo)
                }
            }
            breweryViews[index]?.tag = index
        }
    }
    
    // MARK: - Actions
    @IBAction func showBreweryDetail(_ sender: Any) {
        performSegue(withIdentifier: breweryDetailSegue, sender: sender)
    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == breweryDetailSegue {
            let breweryDetailVC = segue.destination as! BreweryDetailVC
            let breweryButton = (sender! as AnyObject).view as UIView
            breweryDetailVC.breweryIndex = breweryButton.tag
        }
    }

}
