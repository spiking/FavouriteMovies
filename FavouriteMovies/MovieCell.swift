//
//  MusicCell.swift
//  FavouriteMovies
//
//  Created by Adam Thuvesen on 2016-05-21.
//  Copyright © 2016 Adam Thuvesen. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieGrade: UILabel!
    @IBOutlet weak var movieImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieImage.layer.cornerRadius = movieImage.frame.size.width / 2
        movieImage.clipsToBounds = true
    }
    
    func configureCell(movie: Movie) {
        movieTitle.text = movie.movieTitle
        movieDescription.text = movie.movieDescription
        movieGrade.text = String(movie.movieGrade!)        
        movieImage.image = movie.getMovieImg()
    }
}

