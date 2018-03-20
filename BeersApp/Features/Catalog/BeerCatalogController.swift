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
    
    let screenView: CatalogScreen
    let service: BeerService
    
    fileprivate var items: [Beer] = [] {
        didSet {
            let viewModels = items.map {
                CatalogTableViewCellModel(title: $0.name, description: $0.description)
            }
            screenView.currentState = .ready(viewModels)
        }
    }
    
    init(delegate: CatalogScreenDelegate, service: BeerService = BeerAPIService()) {
        screenView = CatalogScreen(delegate: delegate)
        self.service = service
        super.init(nibName: nil, bundle: nil)
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
        fetchBeers()
    }
}

extension BeerCatalogController {
    func fetchBeers(at page: Int = 1, itemsPerPage number: Int = 10) {
        service.fetchBeers(at: page, itemsPerPage: number) { result in
            switch result {
            case .success(let beers):
                self.items = beers
            case .failure(let error):
                print(error)
            }
        }
    }
}
