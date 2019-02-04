//
//  ObjectContextExtension.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import CoreData

protocol NSManagedObjectContextProtocol {
    func allEntities<T: NSManagedObject>(withType type: T.Type) throws -> [T]
    func allEntities<T: NSManagedObject>(withType type: T.Type, predicate: NSPredicate?) throws -> [T]
    func allEntities<T: NSManagedObject>(withType type: T.Type, predicate: NSPredicate?, sortDescriptor: NSSortDescriptor?) throws -> [T]
    func getEntity<T : NSManagedObject>(withType type: T.Type, predicate: NSPredicate?) throws -> T?
    func addEntity<T: NSManagedObject>(withType type : T.Type) -> T?
    func deleteEntities<T: NSManagedObject>(withType type: T.Type, predicate: NSPredicate?) throws -> [T]?
    func deleteEntities<T: NSManagedObject>(withType type: T.Type) throws -> [T]?
    func countNumberOfEntities<T: NSManagedObject>(withType type: T.Type) throws -> Int
    func save() throws
    func delete(_ object: NSManagedObject)
}

extension NSManagedObjectContext: NSManagedObjectContextProtocol {
    
    func countNumberOfEntities<T>(withType type: T.Type) throws -> Int where T : NSManagedObject {
        let request = NSFetchRequest<T>(entityName: T.className)
        return try count(for: request)
    }
    
    func allEntities<T>(withType type: T.Type) throws -> [T] where T : NSManagedObject {
        return try allEntities(withType: type, predicate: nil, sortDescriptor: nil)
    }
    
    func allEntities<T>(withType type: T.Type, predicate: NSPredicate?) throws -> [T] where T : NSManagedObject {
        return try allEntities(withType: type, predicate: predicate, sortDescriptor: nil)
    }
    
    func allEntities<T : NSManagedObject>(withType type: T.Type,
                                          predicate: NSPredicate?,
                                          sortDescriptor: NSSortDescriptor?) throws -> [T] {
        let request = NSFetchRequest<T>(entityName: T.className)
        request.predicate = predicate
        if sortDescriptor != nil {
            request.sortDescriptors = [sortDescriptor!]
        }
        let results = try self.fetch(request)
        
        return results
    }
    
    func getEntity<T : NSManagedObject>(withType type: T.Type, predicate: NSPredicate?) throws -> T? {
        let request = NSFetchRequest<T>(entityName: T.className)
        request.predicate = predicate
        let result = try self.fetch(request).first
        return result
    }
    
    func addEntity<T : NSManagedObject>(withType type: T.Type) -> T? {
        let entityName = T.className
        
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: self) else {
            return nil
        }
        let record = T(entity: entity, insertInto: self)
        return record
    }
    
    func deleteEntities<T: NSManagedObject>(withType type: T.Type, predicate: NSPredicate?) throws -> [T]? {
        let entityName = T.className
        let request = NSFetchRequest<T>(entityName: entityName)
        request.predicate = predicate
        let results = try self.fetch(request)
        for entity in results {
            delete(entity)
        }
        try save()
        return results
    }
    
    func deleteEntities<T: NSManagedObject>(withType type: T.Type) throws -> [T]? {
        return try deleteEntities(withType: type, predicate: nil)
    }
}
