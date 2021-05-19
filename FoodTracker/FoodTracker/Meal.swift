//
//  Meal.swift
//  FoodTracker
//
//  Created by Amr Hesham on 06/03/2021.
//

import Foundation
import UIKit

class Meal: NSObject, NSCoding {
  
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
  
  func encode(with coder: NSCoder) {
    coder.encode(name, forKey: "name")
    coder.encode(photo, forKey: "photo")
    coder.encode(rating, forKey: "rating")
  }
  
  required convenience init?(coder: NSCoder) {
    guard let name = coder.decodeObject(forKey: "name") as? String,
          let photo = coder.decodeObject(forKey: "photo") as? UIImage
    else {
      return nil
    }
    
    let rating = coder.decodeInteger(forKey: "rating")
    self.init(name: name, photo: photo, rating: rating)
  }
}
