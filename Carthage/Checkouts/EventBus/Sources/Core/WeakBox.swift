//
//  WeakBox.swift
//  EventBus
//
//  Created by thiago.lioy on 22/08/18.
//  Copyright © 2018 thiagolioy. All rights reserved.
//

import Foundation

struct WeakBox<T: AnyObject>{
    weak var value: T?
    init(_ value: T) {
        self.value = value
    }
}
