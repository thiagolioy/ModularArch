//
//  Listener.swift
//  EventBus
//
//  Created by thiago.lioy on 22/08/18.
//  Copyright © 2018 thiagolioy. All rights reserved.
//

import Foundation

open class Listener<T: Event> {
    public var identifier: String {
        return String(describing: self)
    }
    
    public init() {}
    
    open func handle(event: T) {}
}

extension Listener: Hashable {
    public var hashValue: Int {
        return identifier.hashValue
    }
    
    public static func == (lhs: Listener<T>, rhs: Listener<T>) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
