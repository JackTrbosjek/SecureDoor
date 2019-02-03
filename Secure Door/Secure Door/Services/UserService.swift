//
//  UserService.swift
//  SecureDoor
//
//  Created by UHP Mac 5 on 01/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

protocol UserService:class {
    func loginUser(email: String, password: String, completion:@escaping (Result<Bool>) -> Void)
    func isUserLoggedIn() -> Bool
    func getCurrentUserEmail() -> String?
    func logoutCurrentUser()
}
