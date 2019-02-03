//
//  Door.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

class Door : BaseModel {
    var name: String?
    
    init(id: UUID?, name: String?) {
        self.name = name
        super.init(id: id)
    }
}
