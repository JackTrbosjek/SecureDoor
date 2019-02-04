//
//  CoreDataInitializer.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

class CoreDataInitializer: Initializable {
    func performInitialization() {
        let adminUserService = AppContainer.resolve(AdminUserService.self)
        adminUserService?.addInitialUserInfo()
        let doorService = AppContainer.resolve(DoorService.self)
        doorService?.addInitialDoorsIfNeeded()
    }
}
