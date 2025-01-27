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
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var movie: Movie!
    var movieID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        guard let movie = movie else { return }
        
        posterImageView.loadFrom(url: movie.poster)
        posterImageView.roundCorners(radius: 24, maskToBounds: false)
        posterImageView.setShadow()
        
        titleLabel.text = movie.title
        yearLabel.text = movie.year ?? "Year not available"
        plotLabel.text = movie.plot ?? "Plot not available"
        runtimeLabel.text = movie.runtime ?? "Runtime not specified"
        genreLabel.text = movie.genre ?? "Genre not specified"
        directorLabel.text = movie.director ?? "Director not specified"
        countryLabel.text = movie.country ?? "Country not specified"
    }
}
