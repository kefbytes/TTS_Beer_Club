//
//  MasterBeerVC.swift
//  Beer Club
//
//  Created by Franks, Kent on 7/10/17.
//  Copyright © 2017 KefBytes. All rights reserved.
//

import UIKit

class MasterBeerVC: UIViewController {
    
    @IBOutlet weak var masterBrewView0: UIView!
    @IBOutlet weak var masterBrewView1: UIView!
    @IBOutlet weak var masterBrewView2: UIView!
    @IBOutlet weak var masterBrewView3: UIView!
    
    let breweries = BreweryList().breweries
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //array of views
        let breweryViews = [masterBrewView0,masterBrewView1,masterBrewView2,masterBrewView3]
        
        for index in 0..<breweryViews.count {
            let brewery = breweries[index]
            for subview in (breweryViews[index]?.subviews)! as [UIView] {
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationItem.title = " "
    }
    
    @IBAction func showBreweryDetail(_ sender: Any) {
        performSegue(withIdentifier: "showBreweryDetail", sender: sender)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBreweryDetail" {
            let detailBeerVC = segue.destination as! DetailBeerVC
            let breweryButton = (sender! as AnyObject).view as UIView!
            detailBeerVC.breweryIndex = (breweryButton?.tag)!
            print((breweryButton?.tag)!)
        }
    }

}











