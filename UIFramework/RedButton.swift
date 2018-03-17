//
//  RedButton.swift
//  UIFramework
//
//  Created by Thiago Lioy on 17/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import UIKit
import SnapKit

public class RedButton: UIView {
    
    lazy fileprivate var label: UIView = {
        let view = UILabel(frame: .zero)
        view.text = "Exemplo"
        view.textAlignment = .center
        return view
    }()

    lazy fileprivate var label2: UIView = {
        let view = UILabel(frame: .zero)
        view.text = "Irado"
        view.textAlignment = .center
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupCodeView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RedButton: CodeView {
    func buildConstraints() {
        label.snp.makeConstraints { make in
            make.top.left.equalTo(self).offset(5)
            make.right.equalTo(self).inset(5)
            make.height.equalTo(20)
        }
        label2.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(5)
            make.left.equalTo(self).offset(5)
            make.right.equalTo(self).inset(5)
            make.height.equalTo(20)
        }
    }

    func buildViewHierarchy() {
        addSubview(label)
        addSubview(label2)
    }

    func setupCustomConfiguration() {
        backgroundColor = .red
    }
}


