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
    
    private static var instance: Container!
    
    static func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return instance.resolve(serviceType)
    }
    
    static func resolveSwRevelController(menuController: MainMenuViewController, mainController: UIViewController) -> SWRevelController {
        return instance.resolve(SWRevelController.self, arguments: menuController, mainController)!
    }
    
    static func build() -> Container {
        instance = Container(defaultObjectScope: .container)
        registerHelpers()
        registerServices()
        
        instance.register(SWRevelController.self) { (r, menuController: MainMenuViewController, mainController: UIViewController) in
            let revelController = SWRevelController()
            revelController.setMenuController(menuController)
            revelController.setMainController(mainController)
            return revelController
        }.inObjectScope(.graph)
        
        return instance
    }
    
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
}
