//
//  SearchedMovie.swift
//  MovieQuest
//
//  Created by Joyce Matos on 12/25/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import Foundation

class SearchedMovie {
    
    let poster: String?
    let title: String
    let type: String
    let year: String
    let imdbID: String
    
    init(poster: String?, title: String, type: String, year: String, imdbID: String) {
        
        self.poster = poster
        self.title = title
        self.type = type
        self.year = year
        self.imdbID = imdbID
        
    }
}

extension OmdbDataStore: CustomStringConvertible {
    var description: String {
        return searchedMovies.description
    }
}
