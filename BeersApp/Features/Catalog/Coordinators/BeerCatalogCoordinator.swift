//
//  BeerCatalogCoordinator.swift
//  BeersApp
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import UIKit
import UIFramework
import ModelsFramework

final class BeerCatalogCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var catalogController: BeerCatalogController?
    
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let controllerPresenter = BeerCatalogPresenter(delegate: self)
        let controller = BeerCatalogController(presenter: controllerPresenter)
        presenter.pushViewController(controller, animated: true)
        catalogController = controller
    }
}

extension BeerCatalogCoordinator: BeerCatalogPresenterDelegate {
    func didClickMe() {
        print("didClickMe from the coordinator")
    }

    func didSelect(beer: Beer) {
        print("didSelect beer \(beer.name) from the coordinator")
    }
}
