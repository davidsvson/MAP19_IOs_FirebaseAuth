//
//  ShoppingItemsViewController.swift
//  MAP19FirebaseAuth
//
//  Created by David Svensson on 2020-02-04.
//  Copyright © 2020 David Svensson. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestoreSwift

class ShoppingItemsViewController : UIViewController {
    
    var db : Firestore!
    
    
    override func viewDidLoad() {
        
        db = Firestore.firestore()
        let auth = Auth.auth()
        
        guard let user = auth.currentUser else { return }
        
        let majs = Item(name: "tomat")
        
        let itemRef = db.collection("users").document(user.uid).collection("items")
        
        do {
            try itemRef.addDocument(from: majs)
            print("Item added")
        } catch let error {
            print("Error writing: \(error)")
        }
        
        
        
    }
    
    
    
    func readFromDB() {
        //
        //
        //        itemRef.addSnapshotListener() {
        //            (snapshot, error) in
        //            guard let documents = snapshot?.documents else {return}
        //
        //            self.shoppingList.removeAll()
        //            for document in documents {
        //                let result = Result {
        //                    try document.data(as: Item.self)
        //                }
        //
        //                 switch result {
        //                   case .success(let item):
        //                    if let item = item {
        //                        self.shoppingList.append(item)
        //
        //                    }
        //                 case .failure(let error):
        //                    print("Error decoding: \(error)")
        //                }
        //            }
        //
        //            for item in self.shoppingList {
        //                print(item.name)
        //            }
        //
        //        }
        
    }
    
}
