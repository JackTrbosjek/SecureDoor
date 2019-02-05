//
//  DoorsInterfaces.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

enum DoorsNavigationOption {
}

protocol DoorsWireframeInterface: WireframeInterface {
    func navigate(to option: DoorsNavigationOption)
    func showDoorInputAlert(completion: @escaping (String?)->Void)
}

protocol DoorsViewInterface: ViewInterface {
    func reloadData()
    func showAddIcon()
}

protocol DoorsPresenterInterface: PresenterInterface {
    func numberOfSections() -> Int
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> DoorViewItemInterface
    func didSelectItem(at indexPath: IndexPath)
    
    func addDoorAction()
}

protocol DoorsInteractorInterface: InteractorInterface {
    func getDoors() -> Result<[Door]>
    func isUserAllowedToOpenDoor(doorId: UUID) -> Result<Bool>
    func isUserAdmin() -> Bool
    func addDoor(name: String) -> Result<Door>
}

protocol DoorViewItemInterface {
    var title: String { get }
}
