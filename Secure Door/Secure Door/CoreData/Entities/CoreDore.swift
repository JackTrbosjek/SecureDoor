//
//  CoreDore.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

extension CoreDoor {
    var door: Door {
        return Door(
            id: self.id!,
            name: self.name!,
            users: self.users!.toUserArray())
    }
}
extension Array where Element: CoreDoor {
    func toDoorArray() -> [Door] {
        return self.map { (coreDoor) -> Door in
            return coreDoor.door
        }
    }
}
