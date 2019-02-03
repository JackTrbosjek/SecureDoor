//
//  CoreDataDoorService.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

class CoreDataDoorService: DoorService {
    private let viewContext: NSManagedObjectContextProtocol
    
    init(viewContext: NSManagedObjectContextProtocol) {
        self.viewContext = viewContext
    }
    
    func getDoors() -> Result<[Door]> {
        do {
            let doors = try viewContext.allEntities(withType: CoreDoor.self)
            return .Success(doors.toDoorArray())
        } catch {
            return .Error(error)
        }
    }
    
    
}
