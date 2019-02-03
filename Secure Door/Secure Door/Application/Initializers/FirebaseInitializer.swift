//
//  FirebaseInitializer.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import Firebase

class FirebaseInitializer : Initializable {
    func performInitialization() {
        FirebaseApp.configure()
    }
}
