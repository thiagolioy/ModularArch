//
//  BeerCatalogPresenterBuilder.swift
//  BeersApp
//
//  Created by Thiago Lioy on 20/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation
import UIKit
import UIFramework

final class BeerCatalogPresenterBuilder {
    
    let delegate: BeerCatalogPresenterDelegate
    
    init(delegate: BeerCatalogPresenterDelegate) {
        self.delegate = delegate
    }
    
    func build(with screen: BeerCatalogScreen) -> BeerCatalogPresenter {
        let presenter = BeerCatalogPresenter(screen: screen, delegate: delegate)
        return presenter
    }
}
