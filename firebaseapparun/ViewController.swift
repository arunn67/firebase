//
//  ViewController.swift
//  firebaseapparun
//
//  Created by apple on 26/05/23.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTXT: UITextField!
    
    
    @IBOutlet weak var passTXT: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginACT(_ sender: Any) {
        let auth = Auth.auth()
        auth.signIn(withEmail: emailTXT.text!, password: passTXT.text!) { authresult, error in
            if error != nil{
                self.present(service.createAllert(title: "error", message: error!.localizedDescription), animated: true,completion: nil)
                 return
                
            }
            let push = self.storyboard?.instantiateViewController(withIdentifier: "welcomeViewController") as! welcomeViewController
            self.navigationController?.pushViewController(push, animated: true)
           
        
             
        }
    }
}

