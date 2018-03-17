//
//  CodeView.swift
//  UIFramework
//
//  Created by Thiago Lioy on 17/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation

protocol CodeView {
    func buildConstraints()
    func buildViewHierarchy()
    func setupCustomConfiguration()
    func setupCodeView()
}

extension CodeView {
    func setupCodeView() {
        buildViewHierarchy()
        buildConstraints()
        setupCustomConfiguration()
    }
}
