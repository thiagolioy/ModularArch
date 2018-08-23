//
//  BeerCatalogController.swift
//  BeersApp
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import UIKit
import ModelsFramework

final class BeerCatalogController: UIViewController {
    
    let screenView = BeerCatalogScreen()
    let presenter: BeerCatalogPresenter
    
    init() {
        self.presenter = BeerCatalogPresenter(screen: screenView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BeerCatalogController {
    override func loadView() {
        super.loadView()
        self.view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchBeers()
    }
}
