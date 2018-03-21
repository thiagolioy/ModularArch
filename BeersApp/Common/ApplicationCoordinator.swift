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
import AnotherFeature

final class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UINavigationController
    private var coordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let coordinator = BeerCatalogCoordinator(presenter: rootViewController, delegate: self)
        window.rootViewController = rootViewController
        coordinator.start()
        window.makeKeyAndVisible()
        coordinators.append(coordinator)
    }
}

extension ApplicationCoordinator: BeerCatalogCoordinatorDelegate {
    func proceedToNext() {
        let coordinator = AnotherCoordinator(presenter: rootViewController)
        coordinators.append(coordinator)
        coordinator.start()
    }
}
