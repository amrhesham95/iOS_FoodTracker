//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Amr Hesham on 06/03/2021.
//

import UIKit

class MealTableViewCell: UITableViewCell {

  // MARK: - Outlets
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var mealImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  
  
  // MARK: - Properties
  
  var meal: Meal? {
    didSet {
      updateCell()
    }
  }
  
  
  // MARK: - Helpers
  
  func updateCell() {
    nameLabel.text = meal?.name
    mealImageView.image = meal?.photo
    ratingControl.rating = meal?.rating ?? .zero
  }
}
