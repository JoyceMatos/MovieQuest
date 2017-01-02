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
    
    var favorites = [Movie]()
    
    @IBOutlet weak var movieView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
 
    @IBAction func searchButton(_ sender: Any) {
        
        
        guard let input = searchTextField.text else { print("leaving searchButton"); return }
        
        DispatchQueue.main.async {
        self.store.getSearchedMovies(title: input) {
                            print("============Getting Called===============")
                self.movieView.reloadData()
            }
        }
        
        // TODO: - Add Activity Indicator 
        
    }
    
    
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieView.delegate = self
        movieView.dataSource = self
        
        
        let width = (movieView.frame.width - leftAndRightPaddings) / numberOfItemsPerRow
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width, height: width + heightAdjustment)
        movieView.collectionViewLayout = layout
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.store.getSearchedMovies(title: "crime") {
            
            DispatchQueue.main.async {
                print("============Getting Called===============")
                self.movieView.reloadData()
            }
        }
        
        
    }
    
    // MARK: - Data Source Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.searchedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        let movie = store.searchedMovies[indexPath.item]
        
        // TODO: - Carefully unwrap image
        let image = loadPosterImage(posterURL: movie.poster!)
        cell.moviePoster.image = image
        cell.titleOfMovie.text = movie.title
        cell.backgroundColor = UIColor.darkGray
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedMovie = store.searchedMovies[indexPath.item]
        
        

        // TODO: - Segue into detailed view 
     //   performSegue(withIdentifier: "showDetail", sender: self)
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destination = segue.destination as! DetailedViewController
            let indexPath = movieView.indexPath(for: sender as! UICollectionViewCell)
            destination.imdbID = store.searchedMovies[(indexPath?.item)!].imdbID

            
        }
        
        
        
        
    }
    
    
    
    
    // Mark: - Image functions
    func loadPosterImage(posterURL: String) -> UIImage? {
        var image: UIImage?
        
        if let url = URL(string: posterURL), let data = try? Data(contentsOf: url) {
            if data != nil {
                return UIImage(data: data)
            }
        }
        return nil
    }

}



