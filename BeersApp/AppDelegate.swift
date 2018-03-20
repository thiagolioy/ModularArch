//
//  AppDelegate.swift
//  BeersApp
//
//  Created by Thiago Lioy on 17/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: ApplicationCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let coordinator = ApplicationCoordinator(window: window)
        
        self.window = window
        self.appCoordinator = coordinator
        
        coordinator.start()
        return true
    }

}

