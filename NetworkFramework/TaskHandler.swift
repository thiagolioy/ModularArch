//
//  TaskHandler.swift
//  NetworkFramework
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation

final class TaskHandler {
    let data: Data?
    let response: URLResponse?
    let error: Error?
    
    private let decoder = JSONDecoder()
    
    init(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    func handle() -> Result<Void> {
        if let error = error {
            return .failure(error)
        }
        return .success(())
    }
    
    func handle<T: Codable>(with responseType: T.Type) -> Result<T> {
        if let error = error {
            return .failure(error)
        }
        guard let data = data else {
            return .failure(NetworkErrors.missingData)
        }
        
        do {
            let decoded = try decoder.decode(T.self, from: data)
            return .success(decoded)
        } catch let error as DecodingError {
            return .failure(error)
        }catch {
            return .failure(error)
        }
    }
}
