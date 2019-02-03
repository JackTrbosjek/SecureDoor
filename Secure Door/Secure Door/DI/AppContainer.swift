//
//  AppContainer.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 02/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import Swinject

final class AppContainer: ContainerProtocol {
    
    private init(){}
    
    static var instance: Container!
    
    /// Helper dependency injections
    private static func registerHelpers() {
        instance.register(CoreDataStack.self) { _ in
            return CoreDataStackImplementation()
        }
        
        instance.register(NSManagedObjectContextProtocol.self) { r in
            let coreDataStack = r.resolve(CoreDataStack.self)!
            return coreDataStack.getViewContext()
        }
    }
    
    /// Service dependency injections
    private static func registerServices() {
        
        instance.register(UserService.self) { _ in
            FirebaseUserService()
        }
        
        instance.register(DoorService.self) { r in
            let viewContext = r.resolve(NSManagedObjectContextProtocol.self)!
            return CoreDataDoorService(viewContext: viewContext)
        }
    }
    
    static func build() -> Container {
        // Automatically defines all registered dependencies as singletons
        instance = Container(defaultObjectScope: .container)
        registerHelpers()
        registerServices()
        
        return instance
    }
    
}
