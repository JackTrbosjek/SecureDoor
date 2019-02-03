//
//  SwinjectInitializer.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation

class SwinjectInitializer : Initializable {
    func performInitialization() {
        let appContainer = AppContainer.build()
        LoginContainer.build(parentContainer: appContainer)
        MainMenuContainer.build(parentContainer: appContainer)
        DoorsContainer.build(parentContainer: appContainer)
    }
}
