//
//  MainMenuPresenter.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 02/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

final class MainMenuPresenter {

    // MARK: - Private properties -
    private weak var _view: MainMenuViewInterface?
    private let _wireframe: MainMenuWireframeInterface
    private let _interactor: MainMenuInteractorInterface

    // MARK: - Lifecycle -

    init(wireframe: MainMenuWireframeInterface, view: MainMenuViewInterface, interactor: MainMenuInteractorInterface) {
        _wireframe = wireframe
        _interactor = interactor
        _view = view
    }
}

// MARK: - Extensions -

extension MainMenuPresenter: MainMenuPresenterInterface {
    
    func viewDidLoad() {
        let email = _interactor.getUserEmail()
        _view?.setUserEmail(email: email!)
        if _interactor.isAdmin() {
            _view?.showUsersButton()
        }
    }
    
    func doorsAction() {
        _wireframe.navigate(to: .doors)
    }
    
    func eventsAction() {
        _wireframe.navigate(to: .events)
    }
    
    func usersAction() {
        _wireframe.navigate(to: .users)
    }
    
    func logoutAction() {
        _interactor.logoutUser()
        _wireframe.navigate(to: .login)
    }
    
    
}
