//
//  Item.swift
//  MAP19FirebaseAuth
//
//  Created by David Svensson on 2020-02-04.
//  Copyright © 2020 David Svensson. All rights reserved.
//

import Foundation

class Item : Codable {
    var name : String
    var done : Bool
    
    init(name : String, done : Bool = false) {
        self.name = name
        self.done = done
    }
    
    func switchDone() {
        done = !done
    }
    
}
