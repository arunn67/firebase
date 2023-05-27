//
//  service.swift
//  arunnback
//
//  Created by apple on 25/05/23.
//

import UIKit


class service {
    static func createAllert( title: String,message:String ) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default){(action)in
            alert.dismiss(animated: true,completion: nil)
            
        }
        alert.addAction(action)
        
        return alert
    }
}
