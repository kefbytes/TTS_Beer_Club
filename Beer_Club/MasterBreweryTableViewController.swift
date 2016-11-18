//
//  MasterBreweryTableViewController.swift
//  Beer_Club
//
//  Created by Franks, Kent on 11/14/16.
//  Copyright © 2016 Franks, Kent. All rights reserved.
//

import UIKit

class MasterBreweryTableViewController: UITableViewController {

    var breweryList: BreweryList?
    var brewery: Brewery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Breweries"
        breweryList = BreweryList()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (breweryList?.breweries.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breweryCell", for: indexPath)

        brewery = breweryList?.breweries[indexPath.row]
        cell.textLabel?.text = brewery?.nickname
        cell.imageView?.image = UIImage(named: (brewery?.logo)!)

        return cell
    }



    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailedBreweryViewController = segue.destination as! DetailedBreweryVC
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = indexPath.row
            detailedBreweryViewController.breweryIndex = selectedRow
        }
    }


}
