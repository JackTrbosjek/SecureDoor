//
//  DoorsInteractor.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import Foundation

final class DoorsInteractor {
    // MARK: - Private properties
    private let _doorService: DoorService
    
    init(doorService: DoorService) {
        _doorService = doorService
    }
}

// MARK: - Extensions -

extension DoorsInteractor: DoorsInteractorInterface {
    func getDoors() -> Result<[Door]> {
        return _doorService.getDoors()
    }
    
}
