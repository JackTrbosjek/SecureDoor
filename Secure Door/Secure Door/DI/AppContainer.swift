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
 
        
    }
    /// Service dependency injections
    private static func registerServices() {
        // User service
        instance.register(UserService.self) { _ in
            FirebaseUserService()
        }
        
    }
    
    static func build() -> Container {
        // Automatically defines all registered dependencies as singletons
        instance = Container(defaultObjectScope: .container)
        registerHelpers()
        registerServices()
        
        instance.register(SWRevelController.self) { r in
            let revelController = SWRevelController()
            let menuController = MainMenuContainer.instance.resolve(MainMenuViewController.self)!
            let doorsController = UIViewController()
            revelController.setMenuController(menuController)
            revelController.setMainController(doorsController)
            return revelController
        }.inObjectScope(.transient)
        
        return instance
    }
    
}
