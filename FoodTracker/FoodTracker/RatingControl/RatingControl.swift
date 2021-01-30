//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Amr Hesham on 30/01/2021.
//

import UIKit

class RatingControl: UIStackView {
    
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
        
        // MARK: - Buttons Creations
        let button = UIButton()
        button.backgroundColor = .red
        
        // MARK: - Constraints
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // MARK: - Adding Actions
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: UIControl.Event.touchUpInside)
        
        addArrangedSubview(button)
        
    }
    
    // MARK - Buttons Actions
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button Tapped!")
    }
}
