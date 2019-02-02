//
//  BasePresenter.swift
//  SecureDoor
//
//  Created by UHP Mac 5 on 01/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation


protocol PresenterInterface: class {
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func viewDidAppear(animated: Bool)
    func viewWillDisappear(animated: Bool)
    func viewDidDisappear(animated: Bool)
}

extension PresenterInterface {
    
    func viewDidLoad() {
        fatalError("Implementation missing...")
    }
    
    func viewWillAppear(animated: Bool) {
        fatalError("Implementation missing...")
    }
    
    func viewDidAppear(animated: Bool) {
        fatalError("Implementation missing...")
    }
    
    func viewWillDisappear(animated: Bool) {
        fatalError("Implementation missing...")
    }
    
    func viewDidDisappear(animated: Bool) {
        fatalError("Implementation missing...")
    }
    
}
