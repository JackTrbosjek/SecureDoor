//
//  DoorsWireframe.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

final class DoorsWireframe {

    // MARK: - Private properties -
    private weak var doorsViewController: DoorsViewController?
    
    init(controller: DoorsViewController) {
        doorsViewController = controller
    }
}

// MARK: - Extensions -

extension DoorsWireframe: DoorsWireframeInterface {
    var viewController: UIViewController? {
        get {
            return doorsViewController
        }
        set {
            doorsViewController = newValue as? DoorsViewController
        }
    }
    
    var navigationController: UINavigationController? {
        return viewController?.navigationController
    }
    

    func navigate(to option: DoorsNavigationOption) {
    }
    
    func showDoorInputAlert(completion: @escaping (String?)->Void) {
        let alert = UIAlertController(title: "New Door", message: "Enter door name:", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Door name..."
        }
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            completion(textField?.text)
        }))
        
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
