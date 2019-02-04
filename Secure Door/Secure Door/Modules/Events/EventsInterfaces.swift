//
//  EventsInterfaces.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

enum EventsNavigationOption {
}

protocol EventsWireframeInterface: WireframeInterface {
    func navigate(to option: EventsNavigationOption)
}

protocol EventsViewInterface: ViewInterface {
    func reloadData()
}

protocol EventsPresenterInterface: PresenterInterface {
    func numberOfSections() -> Int
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> EventViewItemInterface
}

protocol EventsInteractorInterface: InteractorInterface {
    func getEvents() -> Result<[Event]>
}

protocol EventViewItemInterface {
    var eventText: String { get }
}
