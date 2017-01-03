//
//  FavoritesDataStore.swift
//  MovieQuest
//
//  Created by Joyce Matos on 1/2/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation
import CoreData

class FavoritesDataStore {
    
    static let shared = FavoritesDataStore()
    let favorites: [NSManagedObject] = []
    
    private init() { }

}
