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
import EventBus

public protocol BeerCatalogCoordinatorDelegate: class {
    func proceedToNext()
}

public final class BeerCatalogCoordinator: Listener<CatalogEvents> {
    
    private let presenter: UINavigationController
    private var catalogController: BeerCatalogController?
    private weak var delegate: BeerCatalogCoordinatorDelegate?
    
    public init(presenter: UINavigationController, delegate: BeerCatalogCoordinatorDelegate) {
        self.presenter = presenter
        self.delegate = delegate
        super.init()
        EventBus.shared.add(listener: self)
    }
    
    override public func handle(event: CatalogEvents) {
        switch event {
        case .didClickMe:
            delegate?.proceedToNext()
        case .didSelect(let beer):
            print("didSelect beer \(beer.name) from the coordinator")
        }
    }
}

extension BeerCatalogCoordinator: Coordinator {
    public func start() {
        let controller = BeerCatalogController()
        presenter.pushViewController(controller, animated: true)
        catalogController = controller
    }
}

