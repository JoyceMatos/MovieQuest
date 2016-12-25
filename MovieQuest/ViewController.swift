//
//  ViewController.swift
//  MovieQuest
//
//  Created by Joyce Matos on 12/21/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        
////        
//            OmdbAPIClient.getMovies(title: "spotless") { (movie) in
//                
//                print(movie)
//                
//        }
        print("Right before getting called")
        OmdbAPIClient.searchMovies(title: "spot") { (movies) in
            print(movies)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

