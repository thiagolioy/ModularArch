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

public protocol BeerCatalogCoordinatorDelegate: class {
    func proceedToNext()
}

public final class BeerCatalogCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var catalogController: BeerCatalogController?
    private weak var delegate: BeerCatalogCoordinatorDelegate?
    
    public init(presenter: UINavigationController, delegate: BeerCatalogCoordinatorDelegate) {
        self.presenter = presenter
        self.delegate = delegate
    }
    
    public func start() {
        let builder = BeerCatalogPresenterBuilder(delegate: self)
        let controller = BeerCatalogController(builder: builder)
        presenter.pushViewController(controller, animated: true)
        catalogController = controller
    }
}

extension BeerCatalogCoordinator: BeerCatalogPresenterDelegate {
    func didClickMe() {
        delegate?.proceedToNext()
    }

    func didSelect(beer: Beer) {
        print("didSelect beer \(beer.name) from the coordinator")
    }
}
