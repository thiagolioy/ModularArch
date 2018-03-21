//
//  ApplicationCoordinator.swift
//  BeersApp
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import UIKit
import UIFramework
import BeerCatalog

final class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UINavigationController
    
    let coordinator: Coordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        coordinator = BeerCatalogCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        coordinator.start()
        window.makeKeyAndVisible()
    }
}
