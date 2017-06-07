//
//  ProfileViewController.swift
//  TourMe
//
//  Created by Gaby Ecanow on 6/7/17.
//  Copyright © 2017 Gaby Ecanow. All rights reserved.
//

import UIKit

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
    
    @IBAction func onTappedBioEdit(_ sender: Any) {
        //------------------------------------------
        // FIRST, update the bio text
        let updatedBio = "THIS IS A TEST hakjldhkjhdjkahfkjahdjfhajksdhfkjashdflahsdlfjhasldhfljkasdhfljsdhflkjasdhfkljashdflkjhaslkdjfhaksjdhflkajshdfjkashdfkjashdfkjsahfkjahsdfjkahsdlfkjhaslkjdfhkajsdfjkbcsdfhjkwebiudhakjsbdasdhkjasdnjagiudsnkwbegfgsodjakldnakhsdgsodalksjdnajwhegaofjalksdhajksdjhbsdamsndosdfhosudhajs"
        
        //------------------------------------------
        // NEXT, update the bio view size
        // FLT_MAX here simply means no constraint in height
        bioLabel.text = updatedBio
        bioLabel.sizeToFit()
        
        //------------------------------------------
        // FINALLY, update the scroll view content
        // size based on the size of the label
        updateScrollViewContent()
        
    }
    
    func updateScrollViewContent() {
        myScrollView.contentSize.height = mainView.frame.height + 5 + clubsView.frame.height + 5 + bioView.frame.height
    }
    
}
