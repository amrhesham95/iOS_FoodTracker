//
//  Meal.swift
//  FoodTracker
//
//  Created by Amr Hesham on 06/03/2021.
//

import Foundation
import UIKit

class Meal {
  
  // MARK: - Properties
  
  var name: String
  var photo: UIImage?
  var rating: Int
  
  // MARK: - Initialization
  
  init(name: String, photo: UIImage?, rating: Int) {
    self.name = name
    self.photo = photo
    self.rating = rating
  }
}
