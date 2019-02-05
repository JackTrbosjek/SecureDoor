//
//  EventsContainer.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class EventsContainer: ChildContainerProtocol {
    
    private init(){}
    
    private static var instance: Container!
    
    static func buildController() -> EventsViewController {
        return instance.resolve(EventsViewController.self)!
    }
    
    @discardableResult
    static func build(parentContainer: Container) -> Container {
        instance = Container(parent: parentContainer, defaultObjectScope: .graph)
        
        instance.register(EventsInteractorInterface.self) { r in
            EventsInteractor(eventService: r.resolve(EventService.self)!, userService: r.resolve(UserService.self)!)
        }
        
        instance.register(EventsWireframeInterface.self) { (r, viewController: EventsViewController) in
            EventsWireframe(controller: viewController)
        }
        
        instance.register(EventsViewInterface.self) { r in
            r.resolve(EventsViewController.self)!
        }
        
        instance.register(EventsViewController.self) { r in
            let sb = SwinjectStoryboard.create(name: "Events", bundle: nil, container: r)
            return sb.instantiateViewController(ofType: EventsViewController.self)
        }
        
        instance.storyboardInitCompleted(EventsViewController.self) { (r, controller) in
            controller.presenter = r.resolve(EventsPresenterInterface.self, argument: controller)!
        }
        
        instance.register(EventsPresenterInterface.self) { (r, viewController: EventsViewController) in
            EventsPresenter(wireframe: r.resolve(EventsWireframeInterface.self, argument: viewController)!, view: viewController, interactor: r.resolve(EventsInteractorInterface.self)!)
        }
        
        return instance
    }
}
