//
//  MasterBreweryTableVC.swift
//  Beer Club
//
//  Created by Franks, Kent on 7/24/17.
//  Copyright © 2017 KefBytes. All rights reserved.
//

import UIKit

class MasterBreweryTableVC: UITableViewController {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "breweryCell", for: indexPath)

        brewery = breweryList?.breweries[indexPath.row]
        
        cell.textLabel?.text = brewery?.name
        cell.detailTextLabel?.text = "Yummy beer"
        if let logoName = brewery?.logo {
            cell.imageView?.image = UIImage(named: logoName)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBreweryDetail" {
            let detailBeerVC = segue.destination as! DetailBeerVC
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedRow = indexPath.row
                detailBeerVC.breweryIndex = selectedRow
            }
            
        }
    }

}

















