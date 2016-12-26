//
//  ImdbAPIClient.swift
//  MovieQuest
//
//  Created by Joyce Matos on 12/21/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import Foundation

class OmdbAPIClient {
    
    class func getMovies(title: String, completion: @escaping ([String : String]) -> Void) {
        
        let urlString = "http://www.omdbapi.com/?t=\(title)&y=&plot=short&r=json"

        
        guard let url = URL(string: urlString) else { print("optional url: now leaving function"); return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { print("Unable to get data: \(error?.localizedDescription)"); return }
            
            if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : String] {
                
                if let responseJSON = responseJSON {
                   completion(responseJSON)
                }
            }
        }
        task.resume()
    }

    class func searchMovies(title: String, completion: @escaping ([String : Any]) -> Void) {
        
        let urlString = "http://www.omdbapi.com/?s=\(title)&y=&plot=short&r=json&page=1"
        
        guard let url = URL(string: urlString) else { print("optional url: now leaving function"); return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { print("Unable to get data: \(error?.localizedDescription)"); return }
            
            if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                
                if let responseJSON = responseJSON {
                    completion(responseJSON)
                }
            }
        }
        task.resume()
    }
    
    class func getMovieDetails(imdbID: String, completion: @escaping ([String : String]) -> Void) {
        
        let urlString = "http://www.omdbapi.com/?i=\(imdbID)&plot=short&r=json"
        
        guard let url = URL(string: urlString) else { print("optional url: now leaving function"); return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { print("Unable to get data: \(error?.localizedDescription)"); return }
            
            if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : String] {
                
                if let responseJSON = responseJSON {
                    completion(responseJSON)
                }
            }
        }
        task.resume()
        
        
        
        
        
    }
    
}
