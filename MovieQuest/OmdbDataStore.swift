//
//  ImdbDataStore.swift
//  MovieQuest
//
//  Created by Joyce Matos on 12/21/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import Foundation

class OmdbDataStore {
    
    static let shared = OmdbDataStore()
    var searchedMovies: [SearchedMovie] = []
    
    func getSearchedMovies(title: String, completion: () -> Void) {
        
        OmdbAPIClient.searchMovies(title: title) { (movies) in
            self.searchedMovies.removeAll()
            
            let allMovies = movies["Search"] as! [[String : Any]]
            
            
            for item in allMovies {
                
                let poster = item["Poster"] as! String?
                let title = item["Title"] as! String
                let type = item["Type"] as! String
                let year = item["Year"] as! String
                let imdbID = item["imdbID"] as! String
                
                
                let movie = SearchedMovie(poster: poster, title: title, type: type, year: year, imdbID: imdbID)
                
                self.searchedMovies.append(movie)
                
            }
            print(self.searchedMovies)

        }
        
        
    }
    

}
