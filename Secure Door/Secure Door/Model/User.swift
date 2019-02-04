//
//  User.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

class User : BaseModel {
    var email : String = ""
    var firebaseId: String = ""
    
    init(id: UUID?, email: String, firebaseId: String) {
        self.email = email
        self.firebaseId = firebaseId
        super.init(id: id)
    }
}
