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

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var googleSignButton: GIDSignInButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        
        let studentType: String = UserDefaults.standard.value(forKey: "studentType") as! String
        if(studentType == "HS")
        {
            label1.text = "Hello high schooler. Login in with your Google Account..."
        }
        else{
            label1.text = "Hello college student. Login in with your .edu Google Account..."
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
           }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    

    
}

