//
//  LoginPresenter.swift
//  SecureDoor
//
//  Created by UHP Mac 5 on 01/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

final class LoginPresenter {
    
    

    // MARK: - Private properties -
    private weak var _view: LoginViewInterface?
    private let _wireframe: LoginWireframeInterface
    private let _interactor: LoginInteractorInterface

    // MARK: - Lifecycle -

    init(wireframe: LoginWireframeInterface, view: LoginViewInterface, interactor: LoginInteractorInterface) {
        _wireframe = wireframe
        _interactor = interactor
        _view = view
    }
}

// MARK: - Extensions -

extension LoginPresenter: LoginPresenterInterface {

    func loginAction(username: String?, password: String?) {
        guard let username = username, let password = password else {
            return
        }
        _view?.showProgress()
        _interactor.loginUser(username: username, password: password) { [weak self] (result) in
            self?._view?.hideProgress()
            switch(result){
            case let .Success(success):
                if success {
                    self?._wireframe.navigate(to: .home)
                }
            case let .Error(error):
                self?._wireframe.showErrorAlert(with: error.localizedDescription)
            }
        }
    }
    
}
