//
//  editViewController.swift
//  firebaseapparun
//
//  Created by apple on 26/05/23.
//

import UIKit
import Firebase
import FirebaseDatabase

class editViewController: UIViewController {
    
    @IBOutlet weak var editTXT: UITextField!
    var datass = [String:String]()
    
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        arun()
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
                self.editTXT.text = name
                print(self.datass)
                // ...
            }) { error in
                
            }
        }
        
        
        
    }
    @IBAction func editACT(_ sender: Any) {
        let userID = Auth.auth().currentUser?.uid
        var values = ["name": self.editTXT.text!]
        self.ref.child("users").child(userID!).updateChildValues(values)
        
    }
}
