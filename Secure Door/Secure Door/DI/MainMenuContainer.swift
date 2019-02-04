//
//  MainMenuContainer.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 02/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class MainMenuContainer: ChildContainerProtocol {
    
    private init(){}
    
    private static var instance: Container!
    
    static func buildController() -> MainMenuViewController {
        return instance.resolve(MainMenuViewController.self)!
    }
    
    @discardableResult
    static func build(parentContainer: Container) -> Container {
        instance = Container(parent: parentContainer, defaultObjectScope: .graph)
        
        instance.register(MainMenuInteractorInterface.self) { r in
            MainMenuInteractor(userService: r.resolve(UserService.self)!)
        }
        
        instance.register(MainMenuWireframeInterface.self) { (r, viewController: MainMenuViewController)  in
            MainMenuWireframe(controller: viewController)
        }
        
        instance.register(MainMenuViewInterface.self) { r in
            r.resolve(MainMenuViewController.self)!
        }
        
        instance.register(MainMenuViewController.self) { r in
            let sb = SwinjectStoryboard.create(name: "MainMenu", bundle: nil, container: r)
            return sb.instantiateViewController(ofType: MainMenuViewController.self)
        }
        
        instance.storyboardInitCompleted(MainMenuViewController.self) { (r, controller) in
            controller.presenter = r.resolve(MainMenuPresenterInterface.self, argument: controller)!
        }
        
        instance.register(MainMenuPresenterInterface.self) { (r, viewController: MainMenuViewController) in
            MainMenuPresenter(wireframe: r.resolve(MainMenuWireframeInterface.self, argument: viewController)!, view: viewController, interactor: r.resolve(MainMenuInteractorInterface.self)!)
        }
        
        return instance
    }
}
