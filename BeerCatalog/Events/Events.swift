//
//  Events.swift
//  BeerCatalog
//
//  Created by thiago.lioy on 23/08/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation
import EventBus
import ModelsFramework

public enum CatalogEvents: Event {
    case didClickMe
    case didSelect(Beer)
}
