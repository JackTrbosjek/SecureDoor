//
//  UIStoryboardExtension.swift
//  SecureDoor
//
//  Created by UHP Mac 5 on 01/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
    
}
