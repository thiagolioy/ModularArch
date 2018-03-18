//
//  JsonDecoder+FatalError.swift
//  ModelsFrameworkTests
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func fatalDecode<T: Codable>(json data: Data, as model:T.Type) -> T {
        do {
            let beers = try decode(T.self, from: data)
            return beers
        }  catch DecodingError.dataCorrupted(let context) {
            fatalError(context.debugDescription)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("\(key.stringValue) was not found, \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            fatalError("\(type) was expected, \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("no value was found for \(type), \(context.debugDescription)")
        } catch {
            fatalError("I know not this error")
        }
    }
}


