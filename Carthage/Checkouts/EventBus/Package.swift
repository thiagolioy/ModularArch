// swift-tools-version:4.1
//
//  EventBus.swift
//  EventBus
//
//  Created by Thiago lioy on 23/10/15.
//  Copyright © 2017 thiagolioy. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "EventBus",
    products: [
        .library(
            name: "EventBus",
            targets: ["EventBus"]),
        ],
    dependencies: [],
    targets: [
        .target(
            name: "EventBus",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "EventBusTests",
            dependencies: ["EventBus"],
            path: "Tests")
    ]
)
