//
//  DoorsInteractor.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import Foundation

final class DoorsInteractor {
    // MARK: - Private properties
    private let _doorService: DoorService
    private let _userService: UserService
    private let _eventService: EventService
    
    init(doorService: DoorService, userService: UserService, eventService: EventService) {
        _doorService = doorService
        _userService = userService
        _eventService = eventService
    }
}

// MARK: - Extensions -

extension DoorsInteractor: DoorsInteractorInterface {
    func addDoor(name: String) -> Result<Door> {
        return _doorService.addDoor(name: name)
    }
    
    func isUserAdmin() -> Bool {
        return _userService.isAdminUser()
    }
    
    func getDoors() -> Result<[Door]> {
        return _doorService.getDoors()
    }
    
    func isUserAllowedToOpenDoor(doorId: UUID) -> Result<Bool> {
        guard !_userService.isAdminUser() else { // admin is allowed to open any door
            return .Success(true)
        }
        let result = _doorService.getDoor(withId: doorId)
        switch result {
        case let .Success(door):
            return .Success(_checkIsUserAllowedToAccessDoor(door: door))
        case let .Error(error):
            return .Error(error)
        }
    }
    
    private func _checkIsUserAllowedToAccessDoor(door: Door) -> Bool{
        guard let currentUserId = _userService.getCurrentUserId() else {
            return false
        }
        let isAllowed = door.users.contains { (user) -> Bool in
            user.firebaseId == currentUserId
        }
        _createEvent(allowed: isAllowed, door: door, userFirebaseId: currentUserId)
        return isAllowed
    }
    
    private func _createEvent(allowed: Bool, door: Door, userFirebaseId: String) {
        let event: EventCreate = (allowed: allowed, userFirebaseId: userFirebaseId, doorId: door.id!)
        _eventService.add(event: event)
    }
}
