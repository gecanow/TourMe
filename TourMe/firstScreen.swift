
import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth

class firstScreen: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
    @IBAction func collegePRessed(_ sender: Any) {
        UserDefaults.standard.set("College", forKey: "studentType")
    }
    
    @IBAction func hsPressed(_ sender: Any) {
        UserDefaults.standard.set("HS", forKey: "studentType")
    }
    
}

