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
}

protocol DoorsViewInterface: ViewInterface {
    func reloadData()
}

protocol DoorsPresenterInterface: PresenterInterface {
    var view:DoorsViewInterface? { get set }
    
    func numberOfSections() -> Int
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> DoorViewItemInterface
    func didSelectItem(at indexPath: IndexPath)
}

protocol DoorsInteractorInterface: InteractorInterface {
    func getDoors() -> Result<[Door]>
}

protocol DoorViewItemInterface {
    var title: String { get }
}
