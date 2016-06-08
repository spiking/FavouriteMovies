//
//  Movie+CoreDataProperties.swift
//  FavouriteMovies
//
//  Created by Adam Thuvesen on 2016-05-20.
//  Copyright © 2016 Adam Thuvesen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var movieTitle: String?
    @NSManaged var movieDescription: String?
    @NSManaged var movieLink: String?
    @NSManaged var movieGrade: NSNumber?
    @NSManaged var movieImage: NSData?

}
