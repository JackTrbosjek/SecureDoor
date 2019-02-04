//
//  CoreDataAdminUserService.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

class CoreDataAdminUserService: AdminUserService {
    
    private let viewContext: NSManagedObjectContextProtocol
    
    init(viewContext: NSManagedObjectContextProtocol) {
        self.viewContext = viewContext
    }
    
    func addInitialUserInfo() {
        do {
            let count = try viewContext.countNumberOfEntities(withType: CoreUser.self)
            if count == 0 {
                let test1 = viewContext.addEntity(withType: CoreUser.self)
                populateUser(email: "test1@test.com", firebaseId: "Z003jhRVzMO7A3LjLm6ZWtpTMwp2", user: test1)
                let test2 = viewContext.addEntity(withType: CoreUser.self)
                populateUser(email: "test2@test.com", firebaseId: "wePdaM4nEAZZKEBQXwEmZMOpuP62", user: test2)
                let test3 = viewContext.addEntity(withType: CoreUser.self)
                populateUser(email: "test3@test.com", firebaseId: "KIBuYOUKKhYxvC57EyaVMNX2pu22", user: test3)
                let test4 = viewContext.addEntity(withType: CoreUser.self)
                populateUser(email: "test4@test.com", firebaseId: "1IOE0p6KOUZim8PPBmacuQNYm4a2", user: test4)
                try viewContext.save()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func populateUser(email: String, firebaseId: String, user: CoreUser?) {
        user?.id = UUID()
        user?.email = email
        user?.firebaseId = firebaseId
    }
}
