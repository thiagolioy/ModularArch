//
//  AnotherViewController.swift
//  AnotherFeature
//
//  Created by thiago.lioy on 3/21/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import UIKit

final class AnotherViewController: UIViewController {
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .blue
        self.view = view
    }
    
}
