//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import NetworkFramework
import ModelsFramework


PlaygroundPage.current.needsIndefiniteExecution = true

enum Endpoints: Endpoint {
    case beers(page: Int, perPage: Int)
    
    var absoluteString: String {
        switch self {
        case .beers(let page, let perPage):
            return "https://api.punkapi.com/v2/beers?page=\(page)&per_page=\(perPage)"
        }
    }
    
}

let client = NetworkClient()
let endpoint = Endpoints.beers(page: 1, perPage: 1)

client.process(endpoint: endpoint, with: [Beer].self) { result in
    switch result {
    case .success(let value):
        print(value)
    case .failure(let error):
        print(error)
    }
    PlaygroundPage.current.finishExecution()
}
