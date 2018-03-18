//
//  NetworkClient.swift
//  NetworkFramework
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation

public final class NetworkClient {
    private let session: URLSession
    private let networkQueue = DispatchQueue.global()
    private let uiQueue = DispatchQueue.main
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

extension NetworkClient {
    
    public func process<T: Codable>(endpoint: Endpoint, with responseType: T.Type,
                                    callback: @escaping (Result<T>) -> Void) {
        networkQueue.async {
            let task = self.session.dataTask(with: endpoint.request) { data, _, error in
                let handler = TaskHandler(data: data, error: error)
                let result = handler.handle(with: responseType)
                self.uiQueue.async {
                    callback(result)
                }
            }
            task.resume()
        }
    }
    
    public func process(endpoint: Endpoint, callback: @escaping (Result<Void>) -> Void) {
        networkQueue.async {
            let task = self.session.dataTask(with: endpoint.request) { _, _, error in
                let handler = TaskHandler(error: error)
                let result = handler.handle()
                self.uiQueue.async {
                    callback(result)
                }
            }
            task.resume()
            
        }
    }
}
