//
//  CatalogTableViewCell.swift
//  UIFramework
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import UIKit

public struct CatalogTableViewCellModel {
    let title: String
    let description: String
    
    public init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}

public final class CatalogTableViewCell: UITableViewCell {
    
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
    
    func setup(with model: CatalogTableViewCellModel) {
        title.text = model.title
        descriptionLabel.text = model.description
        setupCodeView()
    }
    
}

extension CatalogTableViewCell: Reusable {}

extension CatalogTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(title)
        contentView.addSubview(descriptionLabel)
    }
    
    func buildConstraints() {
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
    
    func setupCustomConfiguration() {
        
    }
    
    
}
