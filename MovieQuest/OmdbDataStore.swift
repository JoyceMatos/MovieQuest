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
    var selectedMovie: Movie?
    
    func getSearchedMovies(title: String, completion: @escaping () -> Void) {
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
            completion()
        }
    }
    
    func getMovieDetails(imdbID: String, completion: @escaping () -> Void) {
        
        OmdbAPIClient.getMovieDetails(imdbID: imdbID) { (movieDetails) in
            self.searchedMovies.removeAll()
            
            if let title = movieDetails["Title"], // as! String
                let year = movieDetails["Year"], // as! String
                let rated = movieDetails["Rated"], // as! String
                let released = movieDetails["Released"], // as! String
                let runtime = movieDetails["Runtime"], // as! String
                let genre = movieDetails["Genre"], // as! String
                let director = movieDetails["Director"], // as! String
                let writer = movieDetails["Writer"], // as! String
                let actors = movieDetails["Actors"], // as! String
                let plot = movieDetails["Plot"], // as! String
                let language = movieDetails["Language"], // as! String
                let country = movieDetails["Country"], // as! String
                let poster = movieDetails["Poster"], // as! String
                let type = movieDetails["Type"], // as! String
                let imdbRating = movieDetails["imdbRating"] { // as! String
                
                self.selectedMovie = Movie(title: title, year: year, rated: rated, released: released, runtime: runtime, genre: genre, director: director, writer: writer, actors: actors, plot: plot, language: language, country: country, poster: nil, type: type, imdbRating: imdbRating)
            }
            completion()
        }
    }
   
}
