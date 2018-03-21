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
        let coordinator = reuse(coordinator: BeerCatalogCoordinator.self, orInit: {
            return BeerCatalogCoordinator(presenter: rootViewController, delegate: self)
        })
        window.rootViewController = rootViewController
        coordinator.start()
        window.makeKeyAndVisible()
    }
}

extension ApplicationCoordinator {
    fileprivate func reuse<T: Coordinator>(coordinator: T.Type,
                                           orInit initCall: () -> Coordinator ) -> Coordinator {
        if let coordinator = coordinators.filter({ $0 is T }).first {
            return coordinator
        }
        
        let newCoordinator = initCall()
        coordinators.append(newCoordinator)
        return newCoordinator
    }
}

extension ApplicationCoordinator: BeerCatalogCoordinatorDelegate {
    func proceedToNext() {
        let coordinator = reuse(coordinator: AnotherCoordinator.self, orInit: {
            return AnotherCoordinator(presenter: rootViewController)
        })
        coordinator.start()
    }
}
