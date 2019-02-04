//
//  LoginWireframe.swift
//  SecureDoor
//
//  Created by UHP Mac 5 on 01/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

final class LoginWireframe {

    // MARK: - Private properties -
    private weak var loginViewController: LoginViewController?
    
    init(controller: LoginViewController) {
        loginViewController = controller
    }
}

// MARK: - Extensions -

extension LoginWireframe: LoginWireframeInterface {
    var viewController: UIViewController? {
        return loginViewController
    }
    
    var navigationController: UINavigationController? {
        return viewController?.navigationController
    }
    

    func navigate(to option: LoginNavigationOption) {
        switch option {
        case .home:
            navigateToHome()
        }
    }
    
    private func navigateToHome() {
        let menuController = MainMenuContainer.buildController()
        let doorsController = DoorsContainer.buildController()
        let homeController = AppContainer.resolveSwRevelController(menuController: menuController, mainController: doorsController)
        UIApplication.shared.keyWindow?.rootViewController = homeController
    }
}
