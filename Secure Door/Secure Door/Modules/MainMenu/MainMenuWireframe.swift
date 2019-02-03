//
//  MainMenuWireframe.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 02/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

final class MainMenuWireframe {

    // MARK: - Private properties -
    private var mainMenuViewController: MainMenuViewController?
    private var revelViewController: SWRevelController?
}

// MARK: - Extensions -

extension MainMenuWireframe: MainMenuWireframeInterface {
    var revelController: SWRevelController? {
        get {
            return revelViewController
        }
        set {
            revelViewController = newValue
        }
    }
    
    var viewController: UIViewController? {
        get {
            return mainMenuViewController
        }
        set {
            mainMenuViewController = newValue as? MainMenuViewController
        }
    }
    
    var navigationController: UINavigationController? {
        return viewController?.navigationController
    }
    

    func navigate(to option: MainMenuNavigationOption) {
        switch option {
        case .doors:
            presentDoors()
        case .login:
            navigateToLogin()
        default:
            break
        }
        revelController?.revealToggle(animated: true)
    }
    
    private func presentDoors() {
        let controller = DoorsContainer.instance.resolve(DoorsViewController.self)!
        revelController?.setMainController(controller)
    }
    
    private func navigateToLogin() {
        let loginController = LoginContainer.instance.resolve(LoginViewController.self)!
        UIApplication.shared.keyWindow?.rootViewController = loginController
    }
}
