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
    var selectedMovie = Movie()
    
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
        }
    }
    
    func getMovieDetails(imdbID: String, completion: () -> Void) {
       
        OmdbAPIClient.getMovieDetails(imdbID: imdbID) { (movieDetails) in
            
            self.searchedMovies.removeAll()

            let title = movieDetails["Title"]
            let year = movieDetails["Year"]
            let rated = movieDetails["Rated"]
            let released = movieDetails["Released"]
            let runtime = movieDetails["Runtime"]
            let genre = movieDetails["Genre"]
            let director = movieDetails["Director"]
            let writer = movieDetails["Writer"]
            let actors = movieDetails["Actors"]
            let plot = movieDetails["Plot"]
            let language = movieDetails["Language"]
            let country = movieDetails["Country"]
            let poster = movieDetails["Poster"]
            let type = movieDetails["Type"]
            let imdbRating = movieDetails["imdbRating"]
            
            selectedMovie = Movie(title: title, year: year, rated: rated, released: released, runtime: runtime, genre: genre, director: director, writer: writer, actors: actors, plot: plot, language: language, country: country, poster: nil, type: type, imdbRating: imdbRating)
                        
        }
        
    }
    

}
