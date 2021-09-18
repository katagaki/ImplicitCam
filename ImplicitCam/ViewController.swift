//
//  ViewController.swift
//  ImplicitCam
//
//  Created by 堅書 on 2021/09/19.
//

import UIKit

// TODO: Add these 2 to your main view controller
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var takePhotoButton: UIButton! // Button that will open the image picker (camera view)
    @IBOutlet weak var capturedImage: UIImageView! // UIImageView that will show the captured image
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Remember to add the 'Privacy - Camera Usage Description' item to your Info.plist!!!
        // Check this project's Info.plist for the example.
    }
    
    // MARK: UIButton function
    
    @IBAction func takePhoto(_ sender: Any) {
        
        // UIImagePickerController will show the camera view, at this point iOS will automatically ask for the camera permissions
        let imagePickerController = UIImagePickerController()
        
        // Set delegate of the image picker to this view controller, allowing it to delegate some tasks to our view controller
        imagePickerController.delegate = self
        
        // Set the source to camera to show the camera view
        imagePickerController.sourceType = .camera
        
        // Present the image picker (camera view)
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: UIImagePickerControllerDelegate delegated functions
    
    // User cancelled the image picker (camera view)
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Dismiss the image picker (camera view)
        dismiss(animated: true, completion: nil)
        
    }
    
    // User captured an image from the image picker (camera view)
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Dismiss the image picker (camera view)
        dismiss(animated: true, completion: nil)
        
        // User captured the image, check if the image is present
        if let image = info[UIImagePickerController.InfoKey.originalImage] {
            /*
             Image is present, put the image in the UIImageView
             You can use the image in other places too, e.g. in a function:
             uploadImage(image as? UIImage ?? UIImage())
            */
            capturedImage.image = image as? UIImage ?? UIImage()
            
            /*
             Swift provides optionals (using the symbol ?). This means that the 'image' variable can either be a value, or null.
             Using ?? allows us to specify a default value when it is null
             In other words, the above one-liner is actually:
              
              if (image as? UIImage == null) {
                 capturedImage.image = UIImage()
              } else {
                 capturedImage.image = image as! UIImage
              }
             */
            
        }
    }

    
}
