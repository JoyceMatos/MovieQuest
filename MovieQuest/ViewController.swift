//
//  ViewController.swift
//  MovieQuest
//
//  Created by Joyce Matos on 12/21/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let store = OmdbDataStore.shared

    private let leftAndRightPaddings: CGFloat = 10.0
    private let numberOfItemsPerRow: CGFloat = 2.0
    let heightAdjustment: CGFloat = 60.0
    
    
    @IBOutlet weak var movieView: UICollectionView!
    
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieView.delegate = self
        movieView.dataSource = self
        
        let width = (movieView.frame.width - leftAndRightPaddings) / numberOfItemsPerRow
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width, height: width + heightAdjustment)
        movieView.collectionViewLayout = layout
        
        store.getSearchedMovies(title: "spot") {
            print("Getting Called")
        }

    }
    
    // MARK: - Data Source Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        
        cell.backgroundColor = UIColor.darkGray
        
        
        return cell
    }
    
    

    
    
    // You can always add a function for headers, ie: title = search term: "spot"



}



