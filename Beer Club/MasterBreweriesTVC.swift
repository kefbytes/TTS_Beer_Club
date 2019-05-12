//
//  MasterBreweriesTVC.swift
//  Beer Club
//
//  Created by Kent Franks on 12/17/18.
//  Copyright © 2018 Kent Franks. All rights reserved.
//

import UIKit

class MasterBreweriesTVC: UIViewController {

    @IBOutlet weak var breweriesTableView: UITableView!
    
    let breweries = BreweryList().breweries
    let breweryDetailSegue = "BreweryDetailSegueTVC"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == breweryDetailSegue {
            let breweryDetailVC = segue.destination as! BreweryDetailVC
            breweryDetailVC.breweryIndex = breweriesTableView.indexPathForSelectedRow?.row ?? 0
        }
    }

}

extension MasterBreweriesTVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BreweryCell", for: indexPath) as! BreweryTableViewCell
        ourTableViewCell.logoImageView.image = UIImage(named: breweries[indexPath.row].logo)
        ourTableViewCell.breweryNameLabel.text = breweries[indexPath.row].name
        return ourTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
