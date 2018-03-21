//
//  CodeView.swift
//  UIFramework
//
//  Created by Thiago Lioy on 17/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation

public protocol CodeView {
    func buildViewHierarchy()
    func buildConstraints()
    func setupCustomConfiguration()
    func setupCodeView()
}

public extension CodeView {
    public func setupCodeView() {
        buildViewHierarchy()
        buildConstraints()
        setupCustomConfiguration()
    }
    
    public func setupCustomConfiguration() {}
}
