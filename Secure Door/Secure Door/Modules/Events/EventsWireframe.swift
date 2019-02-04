//
//  EventsWireframe.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

final class EventsWireframe {

    // MARK: - Private properties -
    private weak var eventsController: EventsViewController?

    // MARK: - Module setup -

    init(controller: EventsViewController) {
        self.eventsController = controller
    }

}

// MARK: - Extensions -
extension EventsWireframe: EventsWireframeInterface {
    
    var viewController: UIViewController? {
        return eventsController
    }
    
    var navigationController: UINavigationController? {
        return eventsController?.navigationController
    }
    

    func navigate(to option: EventsNavigationOption) {
    }
}
