//
//  ProfileViewController.swift
//  TourMe
//
//  Created by Gaby Ecanow on 6/7/17.
//  Copyright © 2017 Gaby Ecanow. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var myScrollView: UIScrollView!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var clubsView: UIView!
    @IBOutlet weak var bioView: UIView!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollView.delegate = self
        updateScrollViewContent()
        
        bioLabel.lineBreakMode = .byWordWrapping
    }
    
    func signOut()
    {
        // [START signout]
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        // get a reference to the app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.goToFirstScreen()
        // [END signout]
    }
    
    @IBAction func onTappedBioEdit(_ sender: Any) {
        //------------------------------------------
        // FIRST, update the bio text
        let updatedBio = "THIS IS A TEST hakjldhkjhdjkahfkjahdjfhajksdhfkjashdflahsdlfjhasldhfljkasdhfljsdhflkjasdhfkljashdflkjhaslkdjfhaksjdhflkajshdfjkashdfkjashdfkjsahfkjahsdfjkahsdlfkjhaslkjdfhkajsdfjkbcsdfhjkwebiudhakjsbdasdhkjasdnjagiudsnkwbegfgsodjakldnakhsdgsodalksjdnajwhegaofjalksdhajksdjhbsdamsndosdfhosudhajs"
        
        //------------------------------------------
        // NEXT, update the bio view size
        // FLT_MAX here simply means no constraint in height
        bioLabel.text = updatedBio
        bioLabel.sizeToFit()

        bioView.sizeToFit()

        
        //------------------------------------------
        // FINALLY, update the scroll view content
        // size based on the size of the label
        updateScrollViewContent()
        
    }
    
    func updateScrollViewContent() {
        myScrollView.contentSize.height = mainView.frame.height + 5 + clubsView.frame.height + 5 + bioView.frame.height
    }
    
}
