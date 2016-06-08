//
//  Movie.swift
//  FavouriteMovies
//
//  Created by Adam Thuvesen on 2016-05-20.
//  Copyright © 2016 Adam Thuvesen. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {

    func saveMovieImg(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.movieImage = data
    }
    
    func getMovieImg() -> UIImage {
        let img = UIImage(data: self.movieImage!)!
        return img
    }
}

// Extension of UIImage which converts the image to a reasonable size

extension UIImage {
    
    func resize(scale:CGFloat)-> UIImage {
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: size.width*scale, height: size.height*scale)))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        imageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
    func resizeToWidth(width:CGFloat)-> UIImage {
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        imageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}



