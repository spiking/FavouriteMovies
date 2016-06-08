//
//  ViewController.swift
//  FavouriteMovies
//
//  Created by Adam Thuvesen on 2016-05-20.
//  Copyright © 2016 Adam Thuvesen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "DetailVC" {
            let destinationController = segue.destinationViewController as! DetailVC
            let indexPath = tableView.indexPathForSelectedRow
            
            let selectedMovie = movies[indexPath!.row]
            destinationController.movie = selectedMovie
            
            destinationController.movieTitle = selectedMovie.movieTitle
            destinationController.movieDescription = selectedMovie.movieDescription
            destinationController.movieLink = selectedMovie.movieLink
            destinationController.movieRating = Double(selectedMovie.movieGrade!)
            destinationController.movieImage = selectedMovie.getMovieImg()
            
        }
    }
    
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            print("Fetch and set results!")
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 170.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            // Make cell transparent
            cell.backgroundColor = UIColor.clearColor()
            cell.contentView.backgroundColor = UIColor.clearColor()
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.grayColor()
            cell.selectedBackgroundView = bgColorView
            
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            print("Configure cell \(movie.movieTitle)")
            
            return cell
        } else {
            return MovieCell()
        }
    }

    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            // Get the movie object from the context, remove it, save
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDelegate.managedObjectContext
            context.deleteObject(movies[indexPath.row])
            appDelegate.saveContext()
            
            movies.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
}






