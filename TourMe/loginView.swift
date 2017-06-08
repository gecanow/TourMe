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
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var enterUni: UITextField!
    var ref: DatabaseReference!
    
    
    
    var email: String = ""
    var containsEDU = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        ref = Database.database().reference()
        
        let name = Auth.auth().currentUser?.displayName
        print("\(name!)")
        topLabel.text = "Hello \(name!)!"
        
        email = (Auth.auth().currentUser?.email)!

        print("\(email)")
        
        let emailEnd = email.substring(from: email.index(email.endIndex, offsetBy: -4))
        
        
        print("\(emailEnd)")
        self.containsEDU = emailEnd == ".edu"
        
        if(self.containsEDU == true)
        {
            label1.text = "I see you have a .EDU email, and are a COLLEGE STUDENT. Please enter your University name:"
            enterUni.isHidden = false
        }
        else
        {
            label1.text = "I see you are a HIGH SCHOOLER. Ready to find tours?"
            enterUni.isHidden = true
        }
        
        
    }
    
    @IBAction func continuePressed(_ sender: Any) {
        if(self.containsEDU == true)
        {
            if(self.enterUni.text != "")
            {
                self.ref.child("users").child((Auth.auth().currentUser?.uid)!).setValue(["inCollege": "true"])
                
                // get a reference to the app delegate
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.goToMainScreen()
            }
            else
            {
                //do nothing
                //alert
            }
        }
        else{
            self.ref.child("users").child((Auth.auth().currentUser?.uid)!).setValue(["inCollege": "false"])
            
            // get a reference to the app delegate
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.goToMainScreen()
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

