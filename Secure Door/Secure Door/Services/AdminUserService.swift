//
//  AdminUserService.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

protocol AdminUserService: class {
    func addInitialUserInfo()
    func getUsers() -> Result<[User]>
    func updateUserDoor(userId: UUID, doorId: UUID, allowed: Bool) -> Result<Void>
}
