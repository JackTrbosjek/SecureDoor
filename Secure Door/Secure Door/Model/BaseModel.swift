//
//  BaseModel.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

class BaseModel {
    
    var id: UUID
    
    init(id: UUID) {
        self.id = id
    }
}

extension BaseModel: Equatable {}

func == (lhs: BaseModel, rhs: BaseModel) -> Bool {
    return lhs.id == rhs.id
}
