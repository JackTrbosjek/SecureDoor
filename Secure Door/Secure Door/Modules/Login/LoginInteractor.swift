//
//  LoginInteractor.swift
//  SecureDoor
//
//  Created by UHP Mac 5 on 01/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import Foundation
import FirebaseAuth

final class LoginInteractor {
    // MARK: - Private properties -
    private let _userService: UserService
    
    init(userService: UserService) {
        _userService = userService
    }
}

// MARK: - Extensions -

extension LoginInteractor: LoginInteractorInterface {
    func loginUser(username: String, password: String, completion: @escaping (Result<Bool>) -> Void) {
        _userService.loginUser(email: username, password: password, completion: completion)
    }
    
}
