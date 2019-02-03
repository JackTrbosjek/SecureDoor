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
    
    static var instance: Container!
    
    @discardableResult
    static func build(parentContainer: Container) -> Container {
        instance = Container(parent: parentContainer, defaultObjectScope: .graph)
        
        instance.register(DoorsInteractorInterface.self) { r in
            DoorsInteractor(doorService: r.resolve(DoorService.self)!)
        }
        
        instance.register(DoorsWireframeInterface.self) { r in
            let wireframe = DoorsWireframe()
            
            return wireframe
        }
        
        instance.register(DoorsViewInterface.self) { r in
            r.resolve(DoorsViewController.self)!
        }
        
        instance.register(DoorsViewController.self) { r in
            let sb = SwinjectStoryboard.create(name: "Doors", bundle: nil, container: r)
            let controller = sb.instantiateViewController(ofType: DoorsViewController.self)
            return controller
            }.initCompleted { (r, controller) in
                let wireframe = r.resolve(DoorsWireframeInterface.self)!
                wireframe.viewController = controller
                let presenter = r.resolve(DoorsPresenterInterface.self)!
                controller.presenter = presenter
                presenter.view = controller
        }
        
        
        instance.register(DoorsPresenterInterface.self) { r in
            DoorsPresenter(wireframe: r.resolve(DoorsWireframeInterface.self)!, interactor: r.resolve(DoorsInteractorInterface.self)!)
        }
        
        return instance
    }
}
