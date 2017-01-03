//
//  DetailedViewController.swift
//  MovieQuest
//
//  Created by Joyce Matos on 12/26/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import UIKit
import CoreData

class DetailedViewController: UIViewController {

    let store = OmdbDataStore.shared
    let favoriteStore = FavoritesDataStore.shared
    
    var imdbID: String?
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieDirectorsLabel: UILabel!
    @IBOutlet weak var movieWritersLabel: UILabel!
    @IBOutlet weak var movieActorsLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var moviePlotLabel: UILabel!
    
    
    @IBAction func favoriteButton(_ sender: Any) {
        
        // Save movies
        
        guard let movieTitle = movieTitleLabel.text else { print("leaving fav button"); return }
        save(title: movieTitle)
        
        print(favoriteStore.favorites)
        
        
    }
    
    
    func save(title: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteMovie", in: managedContext)!
        let movie = NSManagedObject(entity: entity, insertInto: managedContext)
        movie.setValue(title, forKeyPath: "title")
        
        
        do {
            try managedContext.save()
            favoriteStore.favorites.append(movie)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let id = imdbID else { print("no id found"); return }
        
        store.getMovieDetails(imdbID: id) {
            
            DispatchQueue.main.async {
                print("=====DETAILS CALLED===============")
                self.updateLabels()
            }
            
            
        }
    }
    
    func updateLabels() {
        
        // TODO: - Carefully unwrap image
//        let image = loadPosterImage(posterURL: (store.selectedMovie?.poster)!)
//        posterImage.image = image
//        
        movieTitleLabel.text = store.selectedMovie?.title
        movieYearLabel.text = store.selectedMovie?.year
 //       movieDirectorsLabel.text = store.selectedMovie?.director
        movieWritersLabel.text = store.selectedMovie?.writer
        movieActorsLabel.text = store.selectedMovie?.actors
        movieGenreLabel.text = store.selectedMovie?.genre
        moviePlotLabel.text = store.selectedMovie?.plot
    }
    
    func loadPosterImage(posterURL: String) -> UIImage? {
        var image: UIImage?
        
        if let url = URL(string: posterURL), let data = try? Data(contentsOf: url) {
            if data != nil {
                return UIImage(data: data)
            }
        }
        return nil
    }




}
