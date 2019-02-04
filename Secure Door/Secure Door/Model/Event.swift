//
//  Event.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

class Event: BaseModel {
    var dateCreated : Date
    var allowed: Bool
    var user: User
    var door: Door
    
    init(id: UUID?, dateCreated: Date, allowed: Bool, user: User, door: Door) {
        self.dateCreated = dateCreated
        self.allowed = allowed
        self.user = user
        self.door = door
        super.init(id: id)
    }
}
