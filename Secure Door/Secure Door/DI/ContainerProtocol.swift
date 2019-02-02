//
//  ContainerProtocol.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 02/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import Swinject

protocol ContainerProtocol {
    static var instance: Container! { get }
    
    static func build() -> Container
}

protocol ChildContainerProtocol {
    static var instance: Container! { get }
    
    static func build(parentContainer: Container) -> Container
}
