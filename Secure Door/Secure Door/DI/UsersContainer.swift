//
//  UsersContainer.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 05/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class UsersContainer: ChildContainerProtocol {
    
    private init(){}
    
    private static var instance: Container!
    
    static func buildController() -> UsersViewController {
        return instance.resolve(UsersViewController.self)!
    }
    
    @discardableResult
    static func build(parentContainer: Container) -> Container {
        instance = Container(parent: parentContainer, defaultObjectScope: .graph)
        
        instance.register(UsersInteractorInterface.self) { r in
            UsersInteractor(adminUserService: r.resolve(AdminUserService.self)!, doorService: r.resolve(DoorService.self)!)
        }
        
        instance.register(UsersWireframeInterface.self) { (r, viewController: UsersViewController) in
            UsersWireframe(controller: viewController)
        }
        
        instance.register(UsersViewInterface.self) { r in
            r.resolve(UsersViewController.self)!
        }
        
        instance.register(UsersViewController.self) { r in
            let sb = SwinjectStoryboard.create(name: "Users", bundle: nil, container: r)
            return sb.instantiateViewController(ofType: UsersViewController.self)
        }
        
        instance.storyboardInitCompleted(UsersViewController.self) { (r, controller) in
            controller.presenter = r.resolve(UsersPresenterInterface.self, argument: controller)!
        }
        
        instance.register(UsersPresenterInterface.self) { (r, viewController: UsersViewController) in
            UsersPresenter(wireframe: r.resolve(UsersWireframeInterface.self, argument: viewController)!, view: viewController, interactor: r.resolve(UsersInteractorInterface.self)!)
        }
        
        return instance
    }
}
