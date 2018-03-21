//
//  BeerCatalogPresenter.swift
//  BeersApp
//
//  Created by thiago.lioy on 3/20/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation
import ModelsFramework

protocol BeerCatalogPresenterDelegate: class {
    func didClickMe()
    func didSelect(beer: Beer)
}

final class BeerCatalogPresenter {
    
    weak var delegate: BeerCatalogPresenterDelegate?
    let service: BeerService
    let screen: BeerCatalogScreen
    
    private(set) var items: [Beer] = [] {
        didSet {
            screen.currentState = .ready(items)
        }
    }
    
    init(screen: BeerCatalogScreen, delegate: BeerCatalogPresenterDelegate,
         service: BeerService = BeerAPIService()) {
        self.screen = screen
        self.delegate = delegate
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
        delegate?.didClickMe()
    }
    
    func didSelectItem(at index: Int) {
        let beer = items[index]
        delegate?.didSelect(beer: beer)
    }
}
