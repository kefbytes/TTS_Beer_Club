//
//  MasterBreweryCustomTableVC.swift
//  Beer Club
//
//  Created by Franks, Kent on 7/24/17.
//  Copyright © 2017 KefBytes. All rights reserved.
//

import UIKit

class MasterBreweryCustomTableVC: UITableViewController {

    var breweryList: BreweryList?
    var brewery: Brewery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        breweryList = BreweryList()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let breweryCount = breweryList?.breweries.count {
            return breweryCount
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        brewery = breweryList?.breweries[indexPath.row]

        if let cell = tableView.dequeueReusableCell(withIdentifier: "customBreweryCell", for: indexPath) as? BreweryCell, let logoName = brewery?.logo, let addressString = brewery?.addressLink {
            
            cell.logoImage.image = UIImage(named: logoName)
            cell.breweryNameLabel.text = brewery?.name
            cell.addressLabel.text = BreweryUtilities.parseAddress(addressLink: addressString)

            return cell
        }

        return UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCustomBreweryDetail" {
            let detailBeerVC = segue.destination as! DetailBeerVC
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedRow = indexPath.row
                detailBeerVC.breweryIndex = selectedRow
            }
            
        }
    }

}
