//
//  PlacesViewController.swift
//  Favourite Places
//
//  Created by Kevon Rahimi on 17/11/2022.
//

import UIKit
var places = [[String : String]()]
var currentPlace = -1
var buttonClicked:Bool?

class PlacesViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet var table: UITableView!
    
    @IBAction func locateUserButton(_ sender: Any) {
        buttonClicked = false

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonClicked = false
        places = defaults.object(forKey: "lastRun" ) as? [[String:String]] ?? [[String:String]]()
        table.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var content = UIListContentConfiguration.cell()
        if places[indexPath.row]["name"] != nil
        {
            content.text = places[indexPath.row]["name"]
        }
        cell.contentConfiguration = content
        defaults.set(places, forKey: "lastRun")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        currentPlace = indexPath.row
        buttonClicked = true
        performSegue(withIdentifier: "toMap", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            places.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],  with:UITableView.RowAnimation.automatic)
        }
        table.reloadData()
    }
    

    override func viewDidAppear(_ animated: Bool)
    {
        if places.count == 1 && places[0].count == 0
        {
            places.remove(at: 0)
            places.append(["name":"Ashton Building","lat":"53.406566","lon":"-2.966531"])
        }
        currentPlace = -1
        buttonClicked = false
        table.reloadData()
    }
    
}
