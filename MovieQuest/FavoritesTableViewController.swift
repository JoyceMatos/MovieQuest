//
//  FavoritesTableViewController.swift
//  MovieQuest
//
//  Created by Joyce Matos on 1/2/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import UIKit
import CoreData

class FavoritesTableViewController: UITableViewController {

    let store = FavoritesDataStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Favorites"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Fetch and display
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteMovie")
        
        do {
            store.favorites = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        tableView.reloadData()
    }
    


    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.favorites.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)

        let movie = store.favorites[indexPath.row]
        cell.textLabel?.text = movie.value(forKey: "title") as? String

        
        return cell
    }
    

}
