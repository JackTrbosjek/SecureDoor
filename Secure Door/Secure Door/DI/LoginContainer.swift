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

final class LoginContainer: ChildContainerProtocol {
    
    private init(){}
    
    private static var instance: Container!
    
    static func buildController() -> LoginViewController {
        return instance.resolve(LoginViewController.self)!
    }
    
    @discardableResult
    static func build(parentContainer: Container) -> Container {
        instance = Container(parent: parentContainer, defaultObjectScope: .graph)
        
        instance.register(LoginInteractorInterface.self) { r in
            LoginInteractor(userService: r.resolve(UserService.self)!)
        }
        
        instance.register(LoginWireframeInterface.self) { (r, viewController: LoginViewController) in
            LoginWireframe(controller: viewController)
        }
        
        instance.register(LoginViewInterface.self) { r in
            r.resolve(LoginViewController.self)!
        }
        
        instance.register(LoginViewController.self) { r in
            let sb = SwinjectStoryboard.create(name: "Login", bundle: nil, container: r)
            return sb.instantiateViewController(ofType: LoginViewController.self)
        }
        
        instance.storyboardInitCompleted(LoginViewController.self) { (r, controller) in
            controller.presenter = r.resolve(LoginPresenterInterface.self, argument: controller)
        }
        
        instance.register(LoginPresenterInterface.self) { (r, viewController: LoginViewController) in
            LoginPresenter(wireframe: r.resolve(LoginWireframeInterface.self, argument: viewController)!, view: viewController, interactor: r.resolve(LoginInteractorInterface.self)!)
        }
        
        return instance
    }
}
