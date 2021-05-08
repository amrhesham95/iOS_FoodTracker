//
//  ViewController.swift
//  FoodTracker
//
//  Created by Amr Hesham on 19/12/2020.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
  
    @IBAction func selectImageAction(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        
        self.present(imagePickerController, animated: true, completion: nil)
        
        
    }

    
    // MARK: - UITextField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    // MARK: - ImagePickerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image")
        }
        
        photoImageView.image = selectedImage
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

