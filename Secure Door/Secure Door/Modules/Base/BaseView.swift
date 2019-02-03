//
//  BaseView.swift
//  SecureDoor
//
//  Created by UHP Mac 5 on 01/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol ViewInterface: class {
    func showProgress()
    func hideProgress()
}

extension ViewInterface {
    
    func showProgress() {
        SVProgressHUD.show()
    }
    
    func hideProgress() {
        SVProgressHUD.dismiss()
    }
}
