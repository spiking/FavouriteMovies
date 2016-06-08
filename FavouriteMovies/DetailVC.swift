//
//  DetailVC.swift
//  FavouriteMovies
//
//  Created by Adam Thuvesen on 2016-05-21.
//  Copyright © 2016 Adam Thuvesen. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    
    var movieTitle: String!
    var movieDescription: String!
    var movieRating: Double!
    var movieLink: String!
    var movieImage: UIImage!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieImg.layer.cornerRadius = movieImg.bounds.width / 2
        movieImg.clipsToBounds = true
        
        print("Loaded screen!")
        
        titleLabel.text = movieTitle
        descriptionLabel.text = movieDescription
        linkLabel.text = movieLink
        ratingLabel.text = String(10)
        movieImg.image = movieImage
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "WebViewVC" {
            let destinationController = segue.destinationViewController as! WebViewVC
            //destinationController.movieLink = movDetLink
        }
    }

//    @IBAction func linkButtonPressed(sender: AnyObject) {
//        // IMDB Web view
//        print("IMDB")
//    }
}
