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
    
    //firebase doesn't allow cheking other user emails so this way is implemented for now
    private static let adminUserEmail = "admin@admin.com"
    
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
    
    func isAdminUser() -> Bool {
        // this is bad implementation but for now there is no other way to identify admin user
        if let email = auth.currentUser?.email {
            return email.elementsEqual(FirebaseUserService.adminUserEmail)
        }
        return false
    }
    
    func logoutCurrentUser() {
        try! auth.signOut()
    }
}
