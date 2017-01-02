//
//  MovieCellCollectionViewCell.swift
//  MovieQuest
//
//  Created by Joyce Matos on 12/26/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    var didTap = false
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var titleOfMovie: UILabel!
    
    
    @IBAction func favoriteButton(_ sender: Any) {
        
        didTap = true
        print(didTap)
            
            print(titleOfMovie.text)
           // add info to favorites
            // Store in core data
            // populate tableview of Favorites
            
       
            // Remove from core data?
        
        
        
        
        // Add animations / colors / actions
        
    }
    
}
