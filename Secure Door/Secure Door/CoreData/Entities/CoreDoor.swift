//
//  CoreDore.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

extension CoreDoor {
    func getDoor(mapUsers: Bool) -> Door {
        return Door(
            id: self.id!,
            name: self.name!,
            users: mapUsers ? self.users!.toUserArray() : nil)
    }
}

extension Array where Element: CoreDoor {
    func toDoorArray(mapUsers: Bool) -> [Door] {
        return self.map { (coreDoor) -> Door in
            return coreDoor.getDoor(mapUsers: mapUsers)
        }
    }
}

extension NSOrderedSet {
    func toDoorArray(mapUsers: Bool)->[Door] {
        let coreDoors = self.array as! [CoreDoor]
        return coreDoors.toDoorArray(mapUsers: mapUsers)
    }
}
