//
//  BeerCatalogPresenter.swift
//  BeersApp
//
//  Created by thiago.lioy on 3/20/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation
import ModelsFramework
import EventBus

final class BeerCatalogPresenter {
    
    
    let service: BeerService
    let screen: BeerCatalogScreen
    
    private(set) var items: [Beer] = [] {
        didSet {
            screen.currentState = .ready(items)
        }
    }
    
    init(screen: BeerCatalogScreen,
         service: BeerService = BeerAPIService()) {
        self.screen = screen
        self.service = service
        
        self.screen.delegate = self
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

extension BeerCatalogPresenter: BeerCatalogScreenDelegate {
    func didClickMe() {
        EventBus.shared
            .emit(event: CatalogEvents.didClickMe)
    }
    
    func didSelectItem(at index: Int) {
        let beer = items[index]
        EventBus.shared
            .emit(event: CatalogEvents.didSelect(beer))
    }
}
