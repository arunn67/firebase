//
//  signinViewController.swift
//  firebaseapparun
//
//  Created by apple on 26/05/23.
//

import UIKit
import Firebase
import FirebaseDatabase

class signinViewController: UIViewController {

    @IBOutlet weak var emailTXT: UITextField!
    @IBOutlet weak var nameTXT: UITextField!
    @IBOutlet weak var passTXT: UITextField!
    
    var ref: DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signupACT(_ sender: Any) {
        let auth = Auth.auth()
        auth.createUser(withEmail: self.emailTXT.text!, password: self.passTXT.text!,completion: { authrr, error in
            if error != nil{
                self.present(service.createAllert(title: "error", message: error!.localizedDescription), animated: true,completion: nil)
                 return
                
            }
            else{
                self.performSegue(withIdentifier: "signup", sender: nil)
                
                guard let uid = authrr?.user.uid else {return }
                var values = ["name": self.nameTXT.text!,"email":self.emailTXT.text!,"pasword":self.passTXT.text!]
                self.ref.child("users").child(uid).setValue(values)            }
           
        })
        
    }
    
    
        
        
        
  
}
