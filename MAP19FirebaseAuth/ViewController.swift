//
//  ViewController.swift
//  MAP19FirebaseAuth
//
//  Created by David Svensson on 2020-02-04.
//  Copyright © 2020 David Svensson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class ViewController: UIViewController {

   // var db: Firestore!
    
  //  var shoppingList = [Item]()
    var auth :Auth!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTExtField: UITextField!
    
    let segueID = "signedInSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        auth = Auth.auth()
        
      
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
       if let user = self.auth.currentUser {
            print(user.email)
            performSegue(withIdentifier: segueID, sender: self)
                 
     //            do {
     //                try auth.signOut()
     //            } catch {
     //                print("Error signing out")
     //            }
             }
        
        
    }
    

    
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
       // createUser()
        signInUser()
    }
    
    
    func signInUser() {
        guard let email = emailTextField.text else {return}
               
        guard let password = passwordTExtField.text else {return}
        
        auth.signIn(withEmail: email, password: password) {
            user, error in
            
            if let user = self.auth.currentUser {
                self.performSegue(withIdentifier: self.segueID, sender: self)
            } else {
                print("Error: \(error)")
            }
        }
        
    }
    
    
    func createUser() {
        guard let email = emailTextField.text else {return}
        
        guard let password = passwordTExtField.text else {return}
        
        auth.createUser(withEmail: email, password: password) {
            result, error in
            
            if let user = self.auth.currentUser {
                
                self.performSegue(withIdentifier: self.segueID, sender: self)
            } else {
                print("Error: \(error)")
            }
        }
    }
    
    

    

    
    
}

