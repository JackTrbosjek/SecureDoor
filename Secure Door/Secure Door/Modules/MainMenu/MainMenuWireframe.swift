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
    private weak var mainMenuViewController: MainMenuViewController?
    private var revelViewController: SWRevelController? {
        return mainMenuViewController?.parent as? SWRevelController
    }
    
    init(controller: MainMenuViewController) {
        mainMenuViewController = controller
    }
}

// MARK: - Extensions -

extension MainMenuWireframe: MainMenuWireframeInterface {
    
    var viewController: UIViewController? {
            return mainMenuViewController
    }
    
    var navigationController: UINavigationController? {
        return viewController?.navigationController
    }
    

    func navigate(to option: MainMenuNavigationOption) {
        switch option {
        case .doors:
            presentDoors()
        case .events:
            presentEvents()
        case .users:
            presentUsers()
        case .login:
            navigateToLogin()
        }
        revelViewController?.revealToggle(animated: true)
    }
    
    private func presentUsers() {
        let controller = UsersContainer.buildController()
        revelViewController?.setMainController(controller)
    }
    
    private func presentDoors() {
        let controller = DoorsContainer.buildController()
        revelViewController?.setMainController(controller)
    }
    
    private func presentEvents() {
        let controller = EventsContainer.buildController()
        revelViewController?.setMainController(controller)
    }
    
    private func navigateToLogin() {
        let loginController = LoginContainer.buildController()
        UIApplication.shared.keyWindow?.rootViewController = loginController
    }
}
