//
//  CoreUser.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

extension CoreUser {
    var user: User {
        return User(
            id: self.id,
            email: self.email ?? "N/A",
            firebaseId: self.firebaseId ?? "",
            doors: self.doors?.toDoorArray(mapUsers: false))
    }
}
extension Array where Element: CoreUser {
    func toUserArray() -> [User] {
        return self.map { (coreUser) -> User in
            return coreUser.user
        }
    }
}

extension NSSet {
    func toUserArray()->[User] {
        let coreUsers = self.allObjects as! [CoreUser]
        return coreUsers.toUserArray()
    }
}

