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
    private var loginViewController: LoginViewController?
}

// MARK: - Extensions -

extension LoginWireframe: LoginWireframeInterface {
    var viewController: UIViewController? {
        get {
            return loginViewController
        }
        set {
            loginViewController = newValue as? LoginViewController
        }
    }
    
    var navigationController: UINavigationController? {
        get {
            return viewController?.navigationController
        }
    }
    

    func navigate(to option: LoginNavigationOption) {
        switch option {
        case .home:
            navigateToHome()
        }
    }
    
    private func navigateToHome() {
        let homeController = MainMenuContainer.instance.resolve(SWRevelController.self)!
        UIApplication.shared.keyWindow?.rootViewController = homeController
    }
}
