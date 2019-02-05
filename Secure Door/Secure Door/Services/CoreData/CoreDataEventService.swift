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
            let sortDescriptor = NSSortDescriptor(key: "dateCreated", ascending: false)
            let events = try viewContext.allEntities(withType: CoreEvent.self, predicate: nil, sortDescriptor: sortDescriptor)
            return .Success(events.toEventArray())
        } catch {
            return .Error(error)
        }
    }
    
    func getEventForUser(firebaseId: String) -> Result<[Event]> {
        do {
            let predicate = NSPredicate(format: "user.firebaseId = %@", firebaseId)
            let sortDescriptor = NSSortDescriptor(key: "dateCreated", ascending: false)
            let events = try viewContext.allEntities(withType: CoreEvent.self, predicate: predicate, sortDescriptor: sortDescriptor)
            return .Success(events.toEventArray())
        } catch {
            return .Error(error)
        }
    }
    
    func add(event: EventCreate) {
        do {
            let coreUser = try viewContext.getEntity(withType: CoreUser.self, predicate: NSPredicate(format: "firebaseId = %@", event.userFirebaseId))
            let coreDoor = try viewContext.getEntity(withType: CoreDoor.self, predicate: NSPredicate(format: "id = %@", event.doorId.uuidString))
            let newEvent = viewContext.addEntity(withType: CoreEvent.self)
            newEvent?.id = UUID()
            newEvent?.door = coreDoor
            newEvent?.user = coreUser
            newEvent?.allowed = event.allowed
            newEvent?.dateCreated = Date()
            try viewContext.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}
