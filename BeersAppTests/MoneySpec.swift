//
//  BeersAppTests.swift
//  BeersAppTests
//
//  Created by Thiago Lioy on 17/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Quick
import Nimble
@testable import BeersApp

class MoneySpec: QuickSpec {
    override func spec() {
        describe("the 'Moeny' class") {
            it("has everything you need to get started") {
                let money = Money()
                expect(money.valid()).to(beTrue())
            }
        }
    }
}
