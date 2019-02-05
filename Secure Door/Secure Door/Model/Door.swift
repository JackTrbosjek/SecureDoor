//
//  Door.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

class Door : BaseModel {
    var name: String
    var users: [User]?
    init(id: UUID, name: String, users: [User]?) {
        self.name = name
        self.users = users
        super.init(id: id)
    }
}

extension Door: DoorViewItemInterface {
    var title: String {
        return self.name
    }
}

extension Door {
    func userAllowed(userId: UUID) -> Bool {
        return self.users?.contains(where: { (user) -> Bool in
            user.id == userId
        }) ?? false
    }
}
