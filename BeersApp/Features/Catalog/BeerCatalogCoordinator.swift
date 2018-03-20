//
//  BeerCatalogCoordinator.swift
//  BeersApp
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import UIKit
import UIFramework

final class BeerCatalogCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var catalogController: BeerCatalogController?
    
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let controller = BeerCatalogController(delegate: self)
        presenter.pushViewController(controller, animated: true)
        catalogController = controller
    }
}

extension BeerCatalogCoordinator: CatalogScreenDelegate {
    func didClickMe() {
        print("didClickMe from the coordinator")
    }
    
    func didSelectItem(at index: Int) {
        print("select item at index: \(index)")
    }
}
