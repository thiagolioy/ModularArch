//
//  JsonLoader.swift
//  ModelsFrameworkTests
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation

protocol BundleLoadable {
    init(bundle: Bundle)
    func load(file name: String, withExtension ext: String) -> Data
}

final class JsonLoader: BundleLoadable {
    
    let bundle: Bundle
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    func load(file name: String, withExtension ext: String) -> Data {
        guard let filePath = bundle.path(forResource: name, ofType: ext) else {
            fatalError("Invalid resource path with name: \(name) and extension: \(ext)")
        }
        let fileURL = URL(fileURLWithPath: filePath)
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Error on getting data from path \(fileURL.absoluteString)")
        }
        return data
    }
}
