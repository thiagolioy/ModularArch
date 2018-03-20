//
//  BeerCatalogPresenter.swift
//  BeersApp
//
//  Created by thiago.lioy on 3/20/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation
import ModelsFramework
import UIFramework

final class BeerCatalogPresenter {
    
    let service: BeerService
    weak var screen: BeerCatalogScreen?
    
    private(set) var items: [Beer] = [] {
        didSet {
            screen?.currentState = .ready(items)
        }
    }
    
    init(service: BeerService = BeerAPIService()) {
        self.service = service
    }
    
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
