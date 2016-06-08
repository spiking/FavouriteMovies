//
//  AddMovieVC.swift
//  FavouriteMovies
//
//  Created by Adam Thuvesen on 2016-05-21.
//  Copyright © 2016 Adam Thuvesen. All rights reserved.
//

import UIKit
import CoreData


class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var addTitleTextField: UITextField!
    @IBOutlet weak var addDescriptionTextField: UITextField!
    @IBOutlet weak var addIMDBTextField: UITextField!
    @IBOutlet weak var addRatingTextField: UITextField!
    
    @IBOutlet weak var movieImg: UIImageView!
    
    @IBOutlet weak var addImageButton: UIButton!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = movieImg.bounds.width / 2
        movieImg.clipsToBounds = true
        
        // Add tap gesture to be able to hide keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddMovieVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        addRatingTextField.delegate = self
    }
    
    @IBAction func saveMoviePressed(sender: AnyObject) {
        
        if let title = addTitleTextField.text where title != "", let grade = addRatingTextField.text where grade != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)
            let movie = Movie(entity: entity!, insertIntoManagedObjectContext: context)
            
            movie.movieTitle = addTitleTextField.text
            movie.movieDescription = addDescriptionTextField.text
            movie.movieLink = addIMDBTextField.text
            movie.movieGrade = Double(addRatingTextField.text!)
            movie.saveMovieImg(movieImg.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save()
                print("Movie saved!")
            } catch  {
                print("A error occured, could not save!")
            }
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            showInputAlert()
        }
    }
    
    @IBAction func canelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addMovieImage(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        addImageButton.hidden = true
        movieImg.image = image.resizeToWidth(500)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showInputAlert() {
        let alert = UIAlertController(title: "Data missing!", message: "Please enter a title and a rating for the movie.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // Only numeric input for rating (IPad)
    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                                                 replacementString string: String) -> Bool {
        
        // Create an `NSCharacterSet` set which includes everything but the digits
        let inverseSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
        let components = string.componentsSeparatedByCharactersInSet(inverseSet)
        let filtered = components.joinWithSeparator("")
        
        return string == filtered
    }
}
