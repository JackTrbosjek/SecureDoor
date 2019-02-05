//
//  CoreEvent.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

extension CoreEvent {
    var event: Event {
        return Event(
            id: self.id,
            dateCreated: self.dateCreated!,
            allowed: self.allowed,
            user: self.user!.user,
            door: self.door!.getDoor(mapUsers: false))
    }
}

extension Array where Element: CoreEvent {
    func toEventArray() -> [Event] {
        return self.map { (coreEvent) -> Event in
            return coreEvent.event
        }
    }
}
