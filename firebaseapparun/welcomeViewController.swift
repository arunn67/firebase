//
//  welcomeViewController.swift
//  firebaseapparun
//
//  Created by apple on 26/05/23.
//

import UIKit
import Firebase
import FirebaseDatabase

class welcomeViewController: UIViewController {
    var ref: DatabaseReference!
    
    @IBOutlet weak var nameLBL: UILabel!
    
    
    var datass = [String:String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
       

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        arun()

    }
    
  
   
        
    
    @IBAction func editACT(_ sender: Any) {
        let push = storyboard?.instantiateViewController(withIdentifier: "editViewController") as! editViewController
        self.navigationController?.pushViewController(push, animated: true)
    }
    
    @IBAction func logoutACT(_ sender: Any) {
        do
        {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "out", sender: nil)
        }catch let error {
            print("errorrrrrr")
        }
        
        
    }
    func arun(){
        DispatchQueue.main.async {
            let userID = Auth.auth().currentUser?.uid
            print(userID)
            self.ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { snapshot in
              // Get user value
                print(snapshot)
                self.datass = snapshot.value as! [String : String]
                let name = self.datass["name"]
                print(name)
                self.nameLBL.text = name
                self.nameLBL.textAlignment = .center
                self.nameLBL.font = .boldSystemFont(ofSize: 20)
                print(self.datass)
              // ...
            }) { error in
                self.nameLBL.text =  error.localizedDescription
                
            }
        }
       
    
        
    }
}
    

