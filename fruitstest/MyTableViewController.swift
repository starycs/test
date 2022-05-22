//
//  MyTableViewController.swift
//  fruitstest
//
//  Created by Vladislav  Staryk on 22.05.2022.
//

import UIKit

class MyTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    let data = ["Apple", "Orange", "Pineapple", "Watermelon", "Melon", "Grape"]
    
    
    //НЕ МОГУ СВЯЗАТЬ С МАСИВОМ(
//    struct fruct {
//        var nameFructs: String
//    }
//    var fructs = [
//    fruct (nameFructs: "Apple"),
//    fruct (nameFructs: "Orange"),
//    fruct (nameFructs: "Pineapple"),
//    fruct (nameFructs: "Watermelon"),
//    fruct (nameFructs: "Melon"),
//    fruct (nameFructs: "Grape"),
//    ]
//        fructs.sort [
//            $0.nameFructs < $1.nameFructs
//
//        }let sortedFructs = fructs.sorted {
//            $0.nameFructs < $1.nameFructs
//        ]
//
//    }
//
    
    var filteredData: [String]!
    
 
 
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        filteredData = data

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }

    // MARK: Search bar config
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == ""{

            filteredData = data
            
        }
        else{
            for fruit in data {
            if fruit.lowercased().contains(searchText.lowercased()) {
                filteredData.append(fruit)
            }
        }
    }
        self.tableView.reloadData()
    }

}
