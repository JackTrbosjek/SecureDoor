//
//  EventService.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

protocol EventService: class {
    func getAllEvents() -> Result<[Event]>
    func getEventForUser(userId: UUID) -> Result<[Event]>
    func add(event: Event)
}
