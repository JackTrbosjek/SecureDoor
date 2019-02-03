//
//  FirebaseUserService.swift
//  SecureDoor
//
//  Created by UHP Mac 5 on 01/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseUserService : UserService {
    
    
    lazy var auth: Auth = {
       return Auth.auth()
    }()
    func loginUser(email: String, password: String, completion: @escaping (Result<Bool>) -> Void) {
        auth.signIn(withEmail: email, password: password) { (data, error) in
            if data?.user != nil {
                completion(.Success(true))
            }
            if let error = error {
                completion(.Error(error))
            }
        }
    }
    
    func isUserLoggedIn() -> Bool {
        return auth.currentUser != nil
    }
    
    func getCurrentUserEmail() -> String? {
        return auth.currentUser?.email
    }
    
    func logoutCurrentUser() {
        try! auth.signOut()
    }
}
