//
//  DetailedViewController.swift
//  MovieQuest
//
//  Created by Joyce Matos on 12/26/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    let store = OmdbDataStore.shared
    
    var imdbID: String?
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieDirectorsLabel: UILabel!
    @IBOutlet weak var movieWritersLabel: UILabel!
    @IBOutlet weak var movieActorsLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var moviePlotLabel: UILabel!
    
    
    
     
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let id = imdbID else { print("no id found"); return }
        
        store.getMovieDetails(imdbID: id) { 
            
            DispatchQueue.main.async {
                print("=====DETAILS CALLED===============")
            }
            
            
        }
    }
    



}
