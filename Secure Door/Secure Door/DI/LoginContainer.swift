//
//  ModulesContainer.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 02/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class LoginContainer: ChildContainerProtocol {
    
    private init(){}
    
    static var instance: Container!
    
    @discardableResult
    static func build(parentContainer: Container) -> Container {
        instance = Container(parent: parentContainer, defaultObjectScope: .transient)
        
        instance.register(LoginInteractorInterface.self) { r in
            LoginInteractor(userService: r.resolve(UserService.self)!)
        }
        
        instance.register(LoginWireframeInterface.self) { r in
            LoginWireframe()
        }.inObjectScope(.container)
        
        instance.register(LoginViewInterface.self) { r in
            r.resolve(LoginViewController.self)!
        }
        
        instance.register(LoginViewController.self) { r in
            let sb = SwinjectStoryboard.create(name: "Login", bundle: nil, container: r)
            let controller = sb.instantiateViewController(ofType: LoginViewController.self)
            return controller
        }
        
        instance.storyboardInitCompleted(LoginViewController.self) { (r, controller) in
            let wireframe = r.resolve(LoginWireframeInterface.self)!
            wireframe.viewController = controller
            controller.presenter = r.resolve(LoginPresenterInterface.self)
            controller.presenter.view = controller
        }
        
        instance.register(LoginPresenterInterface.self) { r in
            LoginPresenter(wireframe: r.resolve(LoginWireframeInterface.self)!, interactor: r.resolve(LoginInteractorInterface.self)!)
        }
        
        return instance
    }
}
