//
//  EventsInteractor.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import Foundation

final class EventsInteractor {
    // MARK: - Private properties
    private let _eventService: EventService
    private let _userService: UserService
    
    init(eventService: EventService, userService: UserService) {
        _eventService = eventService
        _userService = userService
    }
}

// MARK: - Extensions -

extension EventsInteractor: EventsInteractorInterface {
    func getEvents() -> Result<[Event]> {
        if _userService.isAdminUser() {
            return _eventService.getAllEvents()
        } else {
            return _eventService.getEventForUser(firebaseId: _userService.getCurrentUserId()!)
        }
    }
    
}
