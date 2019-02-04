//
//  EventsInteractor.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import Foundation

final class EventsInteractor {
}

// MARK: - Extensions -

extension EventsInteractor: EventsInteractorInterface {
    func getEvents() -> Result<[Event]> {
        return .Success([])
    }
    
}
