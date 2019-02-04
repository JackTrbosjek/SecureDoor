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
    
    init(doorService: DoorService, userService: UserService) {
        _doorService = doorService
        _userService = userService
    }
}

// MARK: - Extensions -

extension DoorsInteractor: DoorsInteractorInterface {
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
            return .Success(checkIsUserAllowedToAccessDoor(door: door))
        case let .Error(error):
            return .Error(error)
        }
    }
    
    private func checkIsUserAllowedToAccessDoor(door: Door) -> Bool{
        guard let currentUserId = _userService.getCurrentUserId() else {
            return false
        }
        return door.users.contains { (user) -> Bool in
            user.firebaseId == currentUserId
        }
    }
}
