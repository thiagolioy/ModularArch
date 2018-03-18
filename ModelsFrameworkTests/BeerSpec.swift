//
//  ModelsFrameworkTests.swift
//  ModelsFrameworkTests
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Quick
import Nimble

@testable import ModelsFramework

class BeerSpec: QuickSpec {
    override func spec() {
        describe("the beer") {
            var jsonData: Data!
            
            beforeEach {
                let testBundle = Bundle(for: type(of: self))
                let jsonLoader = JsonLoader(bundle: testBundle)
                jsonData = jsonLoader.load(file: "beers", withExtension: "json")
            }
            
            it("should be able to create a beer from a json") {
                let jsonDecoder = JSONDecoder()
                let beers = jsonDecoder.fatalDecode(json: jsonData, as: [Beer].self)
                expect(beers).toNot(beNil())
                expect(beers.count).to(equal(1))
            }
        }
    }
}



