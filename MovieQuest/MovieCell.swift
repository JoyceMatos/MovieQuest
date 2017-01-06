//
//  MovieCellCollectionViewCell.swift
//  MovieQuest
//
//  Created by Joyce Matos on 12/26/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import UIKit
import CoreData

class MovieCell: UICollectionViewCell {
    
    // Properties
    
    let store = FavoritesDataStore.shared
    var didTap = false

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var titleOfMovie: UILabel!
    
}
