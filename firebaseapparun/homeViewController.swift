//
//  homeViewController.swift
//  firebaseapparun
//
//  Created by apple on 26/05/23.
//

import UIKit
import Firebase

class homeViewController: UIViewController {

    @IBOutlet weak var signupBTN: UIButton!
    @IBOutlet weak var loginBTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       staylogin()
    }

    func staylogin() {
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "nill", sender: nil)

            }
        }
        else{
            let push = storyboard?.instantiateViewController(withIdentifier: "welcomeViewController") as! welcomeViewController
            self.navigationController?.pushViewController(push, animated: true)
//            self.performSegue(withIdentifier: "nill", sender: nil)
        
        }
    }

}
