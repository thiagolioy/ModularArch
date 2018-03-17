//
//  UIFrameworkTests.swift
//  UIFrameworkTests
//
//  Created by Thiago Lioy on 17/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import UIFramework

class UIFrameworkSpec: QuickSpec {
    override func spec() {
        describe("the 'UI'") {
            
            it("has everything you need to get started") {
                let redButton = RedButton(frame: .zero)
                expect(redButton).toNot(beNil())
            }
        }
    }
}


