//
//  ProfileViewController.swift
//  TourMe
//
//  Created by Gaby Ecanow on 6/7/17.
//  Copyright © 2017 Gaby Ecanow. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var clubsText: UITextView!
    @IBOutlet weak var bioText: UITextView!
    var myTexts = [UITextView]()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTexts = [clubsText, bioText]
        
        clubsText.delegate = self
        bioText.delegate = self
        imagePicker.delegate = self
    }
    
    func textViewDidEndEditing(_ sender: UITextView) {
        sender.isEditable = false
    }
    
    @IBAction func onTappedPhotoEdit(_ sender: Any) {
        let changePhotoAction = UIAlertController(title: "Change Profile Picture", message: "Select option.", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (Void) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        let libraryAction = UIAlertAction(title: "Library", style: .default) { (Void) in
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        changePhotoAction.addAction(cameraAction)
        changePhotoAction.addAction(libraryAction)
        changePhotoAction.addAction(cancelAction)
        
        present(changePhotoAction, animated: true, completion: nil)
    }
    
    @IBAction func onTappedEdit(_ sender: UIButton) {
        myTexts[sender.tag].isEditable = true
    }
    
    //==========================================
    // Controls the image picker
    //==========================================
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imagePicker.dismiss(animated: true) {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.profilePic.image = selectedImage
        }
    }
}
