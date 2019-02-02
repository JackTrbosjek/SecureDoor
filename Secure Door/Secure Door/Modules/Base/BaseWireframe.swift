//
//  BaseWireframe.swift
//  SecureDoor
//
//  Created by UHP Mac 5 on 01/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import SafariServices

protocol WireframeInterface: class {
    var viewController: UIViewController? { get set }
    var navigationController: UINavigationController? { get }
    
    func popFromNavigationController(animated: Bool)
    func dismiss(animated: Bool)
    
    func showErrorAlert(with message: String?)
    func showAlert(with title: String?, message: String?)
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction])
}

extension WireframeInterface {

    func popFromNavigationController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
    
    func showErrorAlert(with message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: "Something went wrong", message: message, actions: [okAction])
    }
    
    func showAlert(with title: String?, message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: title, message: message, actions: [okAction])
    }
    
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
