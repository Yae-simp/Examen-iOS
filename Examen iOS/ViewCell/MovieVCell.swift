//
//  MovieVCell.swift
//  Examen iOS
//
//  Created by Tardes on 27/01/2025.
//

import UIKit

class MovieVCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func render(movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = movie.year
        posterImageView.loadFrom(url: movie.poster)
    }
}
