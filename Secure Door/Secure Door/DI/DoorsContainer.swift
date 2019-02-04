//
//  DoorsContainer.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class DoorsContainer: ChildContainerProtocol {
    
    private init(){}
    
    private static var instance: Container!
    
    static func buildController() -> DoorsViewController {
        return instance.resolve(DoorsViewController.self)!
    }
    
    @discardableResult
    static func build(parentContainer: Container) -> Container {
        instance = Container(parent: parentContainer, defaultObjectScope: .graph)
        
        instance.register(DoorsInteractorInterface.self) { r in
            DoorsInteractor(doorService: r.resolve(DoorService.self)!)
        }
        
        instance.register(DoorsWireframeInterface.self) { (r, viewController: DoorsViewController) in
            DoorsWireframe(controller: viewController)
        }
        
        instance.register(DoorsViewInterface.self) { r in
            r.resolve(DoorsViewController.self)!
        }
        
        instance.register(DoorsViewController.self) { r in
            let sb = SwinjectStoryboard.create(name: "Doors", bundle: nil, container: r)
            return sb.instantiateViewController(ofType: DoorsViewController.self)
        }
        
        instance.storyboardInitCompleted(DoorsViewController.self) { (r, controller) in
            controller.presenter = r.resolve(DoorsPresenterInterface.self, argument: controller)!
        }
        
        instance.register(DoorsPresenterInterface.self) { (r, viewController: DoorsViewController) in
            DoorsPresenter(wireframe: r.resolve(DoorsWireframeInterface.self, argument: viewController)!, view: viewController, interactor: r.resolve(DoorsInteractorInterface.self)!)
        }
        
        return instance
    }
}
