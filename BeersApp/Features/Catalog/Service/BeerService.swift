//
//  BeerService.swift
//  BeersApp
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation
import ModelsFramework
import NetworkFramework

protocol BeerService {
    func fetchBeers(at page: Int, itemsPerPage number: Int,
                    callback: @escaping (Result<[Beer]>) -> Void)
}

enum Endpoints: Endpoint {
    case beers(page: Int, perPage: Int)
    
    var absoluteString: String {
        switch self {
        case .beers(let page, let perPage):
            return "https://api.punkapi.com/v2/beers?page=\(page)&per_page=\(perPage)"
        }
    }
    
}

final class BeerAPIService: BeerService {
    
    private let client: NetworkClient
    
    init(client: NetworkClient = NetworkClient()) {
        self.client = client
    }
    
    func fetchBeers(at page: Int, itemsPerPage number: Int,
                    callback: @escaping (Result<[Beer]>) -> Void) {
        
        let endpoint = Endpoints.beers(page: page, perPage: number)
        client.process(endpoint: endpoint,
                       with: [Beer].self,
                       callback: callback)
    }
}
