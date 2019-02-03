//
//  AppDelegate.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 02/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import UIKit
import CoreData
import SWRevealViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var initializers: [Initializable] = [
        SwinjectInitializer(),
        ProgressHudInitializer(),
        FirebaseInitializer()
    ]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initializers.forEach { $0.performInitialization() }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = getRootController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    private func getRootController() -> UIViewController? {
        let userService = AppContainer.instance.resolve(UserService.self)!
        var rootController: UIViewController?
        if userService.isUserLoggedIn() {
            rootController = MainMenuContainer.instance.resolve(SWRevelController.self)
        } else {
            rootController = LoginContainer.instance.resolve(LoginViewController.self)
        }
        return rootController
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        AppContainer.instance.resolve(CoreDataStack.self)?.saveContext()
    }
}

