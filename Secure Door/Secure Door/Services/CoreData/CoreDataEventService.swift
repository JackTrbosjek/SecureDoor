//
//  CoreDataEventService.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

class CoreDataEventService : EventService {

    private let viewContext: NSManagedObjectContextProtocol
    
    init(viewContext: NSManagedObjectContextProtocol) {
        self.viewContext = viewContext
    }
    
    func getAllEvents() -> Result<[Event]> {
        do {
            let events = try viewContext.allEntities(withType: CoreEvent.self)
            return .Success(events.toEventArray())
        } catch {
            return .Error(error)
        }
    }
    
    func getEventForUser(userId: UUID) -> Result<[Event]> {
        do {
            let predicate = NSPredicate(format: "user.id = %@", userId.uuidString)
            let events = try viewContext.allEntities(withType: CoreEvent.self, predicate: predicate)
            return .Success(events.toEventArray())
            
        } catch {
            return .Error(error)
        }
    }
    
    func add(event: Event) {
        do {
            let coreUser = try viewContext.getEntity(withType: CoreUser.self, predicate: NSPredicate(format: "id = %@", event.user.id!.uuidString))
            let coreDoor = try viewContext.getEntity(withType: CoreDoor.self, predicate: NSPredicate(format: "id = %@", event.door.id!.uuidString))
            let newEvent = viewContext.addEntity(withType: CoreEvent.self)
            newEvent?.id = event.id
            newEvent?.door = coreDoor
            newEvent?.user = coreUser
            newEvent?.allowed = event.allowed
            newEvent?.dateCreated = event.dateCreated
            try viewContext.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}
