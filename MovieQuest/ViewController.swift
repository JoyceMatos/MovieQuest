//
//  ViewController.swift
//  MovieQuest
//
//  Created by Joyce Matos on 12/21/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var movieView: UICollectionView!
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 3

    
    let store = OmdbDataStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieView.delegate = self
        movieView.dataSource = self
        
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 1, left: 10, bottom: 10, right: 10)
//        layout.minimumInteritemSpacing = 5
//        layout.minimumLineSpacing = 10
//        
//        movieView.collectionViewLayout = layout
        
        store.getSearchedMovies(title: "spot") {
            print("Getting Called")
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        
        cell.backgroundColor = UIColor.darkGray
        
        
        return cell
    }
    
    

    
    
    
    
    // You can always all a function for headers, ie: title = search term: "spot"



}

extension ViewController : UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

