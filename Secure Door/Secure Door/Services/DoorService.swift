//
//  DoorService.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

protocol DoorService : class {
    func getDoors() -> Result<[Door]>
    func getDoor(withId id: UUID) -> Result<Door>
    func addInitialDoorsIfNeeded()
    func addDoor(name: String) -> Result<Door>
}
