//
//  EventBusSpec.swift
//  EventBus
//
//  Created by Thiago lioy on 04/10/16.
//  Copyright © 2017 thiagolioy. All rights reserved.
//

import Quick
import Nimble

@testable import EventBus

class EventBusSpec: QuickSpec {

    override func spec() {

        describe("EventBusSpec") {
            
            var sut: EventBus!
            
            beforeEach {
                sut = EventBus.shared
            }
            
            it("should be able to add a listener and emit a event") {
                let coord = FakeCoordinator()
                let user = User()
                let event = LoginEvents.didLogin(user)

                sut.add(listener: coord)

                sut.emit(event: event)

                expect(coord.didCallLogin).to(beTrue())
                expect(coord.loginData).toNot(beNil())
            }

            it("should crash after emit event without a Listener") {
                let exception: BadInstructionException? = catchBadInstruction {
                    sut.emit(event: LoginEvents.logout)
                }

                expect(exception).toNot(beNil())
            }

            it("should crash after emit event if not proper Listner exists") {
                let coord = FakeCoordinator()

                sut.add(listener: coord)

                let exception: BadInstructionException? = catchBadInstruction {
                    sut.emit(event: AnotherEvent())
                }
               expect(exception).toNot(beNil())
            }

            it("should crash when trying to add twice the same listener") {
                let coord = FakeCoordinator()
                
                sut.add(listener: coord)
                
                let exception: BadInstructionException? = catchBadInstruction {
                    sut.add(listener: coord)
                }
                expect(exception).toNot(beNil())
            }

            it("should deallocate memory properly") {
                weak var coord = FakeCoordinator()
                if let c = coord {
                    sut.add(listener: c)
                }
                
                coord = nil
                
                let exception: BadInstructionException? = catchBadInstruction {
                    sut.emit(event: LoginEvents.logout)
                }
                expect(exception).toNot(beNil())
            }
            
        }

    }

}

struct User {}

enum LoginEvents: Event {
    case didLogin(User)
    case logout
}

struct AnotherEvent: Event {
}

protocol Coordinator {
    func start()
}

class FakeCoordinator: Listener<LoginEvents> {
    
    var loginData: User?
    var didCallLogin = false
    var didCallLogout = false
    
    override func handle(event: LoginEvents) {
        switch event {
        case .didLogin(let user):
            loginData = user
            didCallLogin = true
        case .logout:
            didCallLogout = true
        }
    }
    
    deinit {
        print("deinit LoginCoordinator")
    }
}


extension FakeCoordinator: Coordinator {
    func start() {}
}
