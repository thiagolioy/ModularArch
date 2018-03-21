//
//  AnotherCoordinator.swift
//  AnotherFeature
//
//  Created by thiago.lioy on 3/21/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation
import UIFramework

public final class AnotherCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    
    public init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    public func start() {
        let controller = AnotherViewController()
        presenter.pushViewController(controller, animated: true)
    }
}
