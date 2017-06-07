//
//  AppDelegate.swift
//  TourMe
//
//  Created by Gaby Ecanow on 6/5/17.
//  Copyright © 2017 Gaby Ecanow. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    var ref: FIRDatabaseReference!
    
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
        -> Bool {
            // Use Firebase library to configure APIs
            FIRApp.configure()
            
            GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
            GIDSignIn.sharedInstance().delegate = self
            
            self.ref = FIRDatabase.database().reference()
            
            let firebaseAuth = FIRAuth.auth()
            do {
                try firebaseAuth?.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            GIDSignIn.sharedInstance().signOut()
            
            if FIRAuth.auth()?.currentUser != nil {
                print("FIREBASE USER EXISTS...")
                print(FIRAuth.auth()?.currentUser?.uid)
                print(FIRAuth.auth()?.currentUser?.email)
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let initViewController: UIViewController = storyBoard.instantiateViewController(withIdentifier: "MainTab")
                self.window?.rootViewController? = initViewController
                
            } else {
                //User Not logged in
                print("USER DOES NOT EXIST")
            }

            
            
            return true
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url,
                                                     sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                     annotation: [:])
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        print("Sign in...")
        if error != nil {
            // ...
            print("\(String(describing: error))")
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            // ...
            if error != nil {
                // ...
                return
            }
            print("Succeed")
            
            self.ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
                
                if snapshot.hasChild("\(user?.uid)"){
                    
                    print("true user exists")
                    
                }
                else{
                    
                    print("false user doesn't exist")
                    
                    self.ref.child("users").child((user?.uid)!).setValue(["studentType": UserDefaults.standard.value(forKey: "studentType")])
                }
                
                
            })
            
            print("FIREBASE USER EXISTS...")
            print("\(user?.email)")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initViewController: UIViewController = storyBoard.instantiateViewController(withIdentifier: "MainTab")
            self.window?.rootViewController? = initViewController
        // ...
        }
    }
    
    
    
    func goToFirstScreen()
    {
        GIDSignIn.sharedInstance().signOut()
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initViewController: UIViewController = storyBoard.instantiateViewController(withIdentifier: "firstView")
        self.window?.rootViewController? = initViewController
    }
    
        
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
        print("Disconnecting...")
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

