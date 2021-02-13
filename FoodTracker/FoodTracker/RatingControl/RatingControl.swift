//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Amr Hesham on 30/01/2021.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    // MARK: - Properties
    private var ratingButtons = [UIButton]()
  @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
    didSet {
      setupButtons()
    }
  }
  @IBInspectable var starCount: Int = 5 {
    didSet {
      setupButtons()
    }
  }
    
    var rating = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    

    // MARK: - Setup Buttons
    private func setupButtons() {
      
      for button in ratingButtons {
        removeArrangedSubview(button)
        button.removeFromSuperview()
      }
      ratingButtons.removeAll()
        
        for _ in 0 ..< starCount {
            // MARK: - Buttons Creations
            let button = UIButton()
            button.backgroundColor = .red
            
            // MARK: - Constraints
          button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
          button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // MARK: - Adding Actions
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: UIControl.Event.touchUpInside)
            
            ratingButtons.append(button)
            addArrangedSubview(button)
            

        }
    }
    
    // MARK - Buttons Actions
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button Tapped!")
    }
}
