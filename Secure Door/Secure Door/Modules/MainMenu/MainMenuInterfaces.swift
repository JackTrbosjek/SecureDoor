//
//  MainMenuInterfaces.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 02/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

enum MainMenuNavigationOption {
    case doors, events, users, login
}

protocol MainMenuWireframeInterface: WireframeInterface {
    func navigate(to option: MainMenuNavigationOption)
}

protocol MainMenuViewInterface: ViewInterface {
    func hideUsersButton()
    func setUserEmail(email: String)
    func showUsersButton()
}

protocol MainMenuPresenterInterface: PresenterInterface {
    func doorsAction()
    func eventsAction()
    func usersAction()
    func logoutAction()
}

protocol MainMenuInteractorInterface: InteractorInterface {
    func getUserEmail() -> String?
    func logoutUser()
    func isAdmin() -> Bool
}
