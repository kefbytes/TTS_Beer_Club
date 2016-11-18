//
//  MasterBreweryViewController.swift
//  Beer_Club
//
//  Created by Franks, Kent on 11/2/16.
//  Copyright © 2016 Franks, Kent. All rights reserved.
//

import UIKit

class MasterBreweryViewController: UIViewController {

    @IBOutlet weak var masterBrewView0: UIView!
    @IBOutlet weak var masterBrewView1: UIView!
    @IBOutlet weak var masterBrewView2: UIView!
    @IBOutlet weak var masterBrewView3: UIView!
    
    let breweries = BreweryList().breweries
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let breweryViews = [masterBrewView0, masterBrewView1, masterBrewView2, masterBrewView3]
        
        for index in 0..<breweryViews.count {
            let brewery = breweries[index]
            for subview in (breweryViews[index]?.subviews)! as [UIView] {
                if let label = subview as? UILabel {
                    label.text = brewery.nickname
                }
                if let logo = subview as? UIImageView {
                    logo.image = UIImage(named: brewery.logo)
                }
            }
            breweryViews[index]?.tag = index
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func showBreweryDetail(_ sender: Any) {
        performSegue(withIdentifier: "showBreweryDetail", sender: sender)
    }
    
    // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBreweryDetail" {
            let detailedBreweryViewController = segue.destination as! DetailedBreweryVC
            let brewerySelectedView = (sender! as AnyObject).view as UIView!
            detailedBreweryViewController.breweryIndex = (brewerySelectedView?.tag)!
        }
     }

    
}

