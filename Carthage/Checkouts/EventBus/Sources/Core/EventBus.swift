//
//  EventBus.swift
//  EventBus
//
//  Created by Thiago lioy on 02/10/17.
//  Copyright © 2017 thiagolioy. All rights reserved.
//

import Foundation

public class EventBus {
    public static let shared = EventBus()
    private var weakListeners: [WeakBox<AnyObject>] = []
    
    private init() {}
    
    public func add<T: Event>(listener: Listener<T>) {
        cleanDeallocatedListeners()
        guard !contains(listener) else {
            fatalError("This listener was already added")
        }
        weakListeners.append(WeakBox(listener))
    }
    
    public func emit<T: Event>(event: T) {
        cleanDeallocatedListeners()
        let list = weakListeners
            .compactMap({ $0.value as? Listener<T> })
        
        if list.isEmpty {
            fatalError("There is no listener for this event")
        }
        
        list.first?.handle(event: event)
    }
}

fileprivate extension EventBus {
    
    fileprivate func cleanDeallocatedListeners() {
        weakListeners = weakListeners.filter({ $0.value != nil })
    }
    
    fileprivate func contains<T: Event>(_ listener: Listener<T>) -> Bool {
        return weakListeners
            .compactMap({ $0.value as? Listener<T> })
            .contains(listener)
    }
}

