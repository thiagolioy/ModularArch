//
//  BeerTableViewCell.swift
//  BeersApp
//
//  Created by thiago.lioy on 3/20/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation
import ModelsFramework
import SnapKit

public final class BeerTableViewCell: UITableViewCell {
    
    lazy var title: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .black
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .black
        return view
    }()
    
    func setup(with model: Beer) {
        title.text = model.name
        descriptionLabel.text = model.description
        setupCodeView()
    }
    
}

extension BeerTableViewCell: Reusable {}

extension BeerTableViewCell: CodeView {
    public func buildViewHierarchy() {
        contentView.addSubview(title)
        contentView.addSubview(descriptionLabel)
    }
    
    public func buildConstraints() {
        title.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(10)
            make.top.equalTo(self.contentView).offset(10)
            make.right.equalTo(self.contentView).inset(10)
            make.height.equalTo(21)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(10)
            make.top.equalTo(self.title.snp.bottom).offset(5)
            make.right.equalTo(self.contentView).inset(10)
            make.height.equalTo(21)
        }
    }
    
    public func setupCustomConfiguration() {
        
    }
    
    
}
