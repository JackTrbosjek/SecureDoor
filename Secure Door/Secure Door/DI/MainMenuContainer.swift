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
    
    static var instance: Container!
    
    @discardableResult
    static func build(parentContainer: Container) -> Container {
        instance = Container(parent: parentContainer, defaultObjectScope: .graph)
        
        instance.register(MainMenuInteractorInterface.self) { r in
            MainMenuInteractor(userService: r.resolve(UserService.self)!)
        }
        
        instance.register(MainMenuWireframeInterface.self) { r in
            let wireframe = MainMenuWireframe()
            
            return wireframe
        }
        
        instance.register(MainMenuViewInterface.self) { r in
            r.resolve(MainMenuViewController.self)!
        }
        
        instance.register(SWRevelController.self) { r in
            let revelController = SWRevelController()
            let menuController = r.resolve(MainMenuViewController.self)!
            let doorsController = DoorsContainer.instance.resolve(DoorsViewController.self)!
            revelController.setMenuController(menuController)
            revelController.setMainController(doorsController)
            return revelController
        }
        
        instance.register(MainMenuViewController.self) { r in
            let sb = SwinjectStoryboard.create(name: "MainMenu", bundle: nil, container: r)
            let controller = sb.instantiateViewController(ofType: MainMenuViewController.self)
            return controller
        }.initCompleted { (r, controller) in
            let wireframe = r.resolve(MainMenuWireframeInterface.self)!
            wireframe.viewController = controller
            wireframe.revelController = r.resolve(SWRevelController.self)
            let presenter = r.resolve(MainMenuPresenterInterface.self)!
            controller.presenter = presenter
            presenter.view = controller
        }
        
        
        instance.register(MainMenuPresenterInterface.self) { r in
            MainMenuPresenter(wireframe: r.resolve(MainMenuWireframeInterface.self)!, interactor: r.resolve(MainMenuInteractorInterface.self)!)
        }
        
        return instance
    }
}
