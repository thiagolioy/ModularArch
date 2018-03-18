//
//  Endpoint.swift
//  NetworkFramework
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation

public protocol Endpoint {
    var absoluteString: String {get}
    var url: URL {get}
    var request: URLRequest {get}
}

public extension Endpoint {
    public var url: URL {
        guard let url = URL(string:absoluteString) else {
            fatalError("Unable to create URL with absoluteString: \(absoluteString)")
        }
        return url
    }
    
    public var request: URLRequest {
        return URLRequest(url: url)
    }
}
