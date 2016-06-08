//
//  MovieTextField.swift
//  FavouriteMovies
//
//  Created by Adam Thuvesen on 2016-05-21.
//  Copyright © 2016 Adam Thuvesen. All rights reserved.
//

import UIKit

class MovieTextField: UITextField {

    required init(coder aDecoder: (NSCoder!)) {
        super.init(coder: aDecoder)!
        
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.clearColor().CGColor
        self.layer.borderWidth = 1.5
//      self.layer.opacity = 0.3
        self.backgroundColor = UIColor.lightGrayColor()
        self.textColor = UIColor.whiteColor()
//      self.textAlignment = .Center
        self.tintColor = UIColor.whiteColor()
        self.keyboardAppearance = .Dark
        self.clearButtonMode = .WhileEditing
        
    }


}
