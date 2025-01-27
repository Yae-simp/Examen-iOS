//
//  DetailVC.swift
//  Examen iOS
//
//  Created by Tardes on 27/01/2025.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var movie: Movie!
    //var movieID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterImageView.roundCorners(radius: 24, maskToBounds: false)
        posterImageView.setShadow()
        posterImageView.loadFrom(url: movie.poster)
        titleLabel.text = movie.title
        yearLabel.text = movie.year
        
        
        // Fetch full movie details using the movie's imdbID
        Task {
            do {
                movie = try await MovieProvider.findMovieBy(id: movie.imdbID)
                self.updateUI() // Update UI after fetching details
            } catch {
                print("Error fetching movie details: \(error)")
            }
        }
    }
    
    func updateUI() {
        guard let movie = movie else { return }
        
        //posterImageView.loadFrom(url: movie.poster)
        
        //titleLabel.text = movie.title
        //yearLabel.text = movie.year
        plotTextView.text = movie.plot ?? "Plot not available"
        runtimeLabel.text = movie.runtime ?? "Runtime not specified"
        genreLabel.text = movie.genre ?? "Genre not specified"
        directorLabel.text = movie.director ?? "Director not specified"
        countryLabel.text = movie.country ?? "Country not specified"
    }
}
