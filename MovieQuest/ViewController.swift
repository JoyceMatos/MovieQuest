//
//  ViewController.swift
//  MovieQuest
//
//  Created by Joyce Matos on 12/21/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let store = OmdbDataStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.getSearchedMovies(title: "spot") {
            print("Getting Called")
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

