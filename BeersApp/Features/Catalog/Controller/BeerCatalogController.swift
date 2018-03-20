//
//  BeerCatalogController.swift
//  BeersApp
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import UIKit
import UIFramework
import ModelsFramework

final class BeerCatalogController: UIViewController {
    
    let screenView: BeerCatalogScreen
    let presenter: BeerCatalogPresenter
    
    init(delegate: BeerCatalogScreenDelegate, presenter: BeerCatalogPresenter) {
        self.screenView = BeerCatalogScreen(delegate: delegate)
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.screen = screenView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BeerCatalogController {
    override func loadView() {
        super.loadView()
        self.view = screenView.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchBeers()
    }
}
