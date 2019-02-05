//
//  CoreDataDoorService.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

class CoreDataDoorService {
    private let viewContext: NSManagedObjectContextProtocol
    
    init(viewContext: NSManagedObjectContextProtocol) {
        self.viewContext = viewContext
    }
}

extension CoreDataDoorService : DoorService {
    
    func getDoors() -> Result<[Door]> {
        do {
            let doors = try viewContext.allEntities(withType: CoreDoor.self)
            return .Success(doors.toDoorArray(mapUsers: true))
        } catch {
            return .Error(error)
        }
    }
    
    func getDoor(withId id: UUID) -> Result<Door> {
        do {
            let predicate = NSPredicate(format: "id = %@", id.uuidString)
            let door = try viewContext.getEntity(withType: CoreDoor.self, predicate: predicate)
            if let door = door {
                return .Success(door.getDoor(mapUsers: true))
            } else {
                return .Error(CoreError(message: "Door with specified id doesn't exist"))
            }
            
        } catch {
            return .Error(error)
        }
    }
    
    func addDoor(name: String) -> Result<Door> {
        do {
            let newDoor = viewContext.addEntity(withType: CoreDoor.self)
            _populateCoreDore(with: name, coreDoor: newDoor)
            try viewContext.save()
            return Result(success: newDoor!.getDoor(mapUsers: false))
        } catch {
            return Result(error: error)
        }
    }
    
    func addInitialDoorsIfNeeded() {
        do {
            let count = try viewContext.countNumberOfEntities(withType: CoreDoor.self)
            if count == 0 {
                let users = try _getLocalUsers()
                let frontDoor = viewContext.addEntity(withType: CoreDoor.self)
                _populateCoreDore(with: "Front Door", coreDoor: frontDoor, users: users.test1, users.test2, users.test3)
                let storageDoor = viewContext.addEntity(withType: CoreDoor.self)
                _populateCoreDore(with: "Storage Door", coreDoor: storageDoor, users: users.test1, users.test2)
                try viewContext.save()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    private func _populateCoreDore(with name: String, coreDoor: CoreDoor?, users: CoreUser?...) {
        coreDoor?.id = UUID()
        coreDoor?.name = name
        coreDoor?.users = NSSet.init(array: users as [Any])
    }
    
    private func _getLocalUsers() throws -> (test1: CoreUser?, test2: CoreUser?, test3: CoreUser?, test4: CoreUser?) {
        let users = try viewContext.allEntities(withType: CoreUser.self)
        let test1 = users.first { (cu) -> Bool in
            cu.email == "test1@test.com"
        }
        let test2 = users.first { (cu) -> Bool in
            cu.email == "test2@test.com"
        }
        let test3 = users.first { (cu) -> Bool in
            cu.email == "test3@test.com"
        }
        let test4 = users.first { (cu) -> Bool in
            cu.email == "test4@test.com"
        }
        return (test1: test1, test2: test2, test3: test3, test4: test4)
    }
    
    
}
