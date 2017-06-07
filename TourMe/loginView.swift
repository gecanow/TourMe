//
//  ViewController.swift
//  TourMe
//
//  Created by Gaby Ecanow on 6/5/17.
//  Copyright © 2017 Gaby Ecanow. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth

class loginView: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var googleSignButton: GIDSignInButton!

    /** @var handle
     @brief The handler for the auth state listener, to allow cancelling later.
     */
 //   var handle: FIRAuthStateDidChangeListenerHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        
     //   GIDSignIn.sharedInstance().signIn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       /* // [START auth_listener]
        handle = FIRAuth.auth()?.addStateDidChangeListener { (auth, user) in
            
            print("in handle")
            if let user = user {
                // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with your backend server,
                // if you have one. Use getTokenWithCompletion:completion: instead.
                let uid = user.uid
                let email = user.email
                let photoURL = user.photoURL
                // ...
                print("HERE")
                print("UID: \(uid)\nEMAIL: \(email)")
            }
        }
        // [END auth_listener] */
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // [START remove_auth_listener]
       // FIRAuth.auth()?.removeStateDidChangeListener(handle!)
        // [END remove_auth_listener]
    }
    

    
}

