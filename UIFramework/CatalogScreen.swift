//
//  BeerCatalogScreen.swift
//  UIFramework
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation
import SnapKit

public protocol CatalogScreenDelegate: class {
    func didClickMe()
    func didSelectItem(at index: Int)
}

public final class CatalogScreen: UIView {
    
    weak var delegate: CatalogScreenDelegate?
    private var datasource: CatalogTableViewDatasource?
    
    public enum UIState {
        case initial
        case loading
        case ready([CatalogTableViewCellModel])
        case emptySearch
        case error
    }
    
    public var currentState: UIState {
        didSet {
            switch currentState {
            case .initial:
                print("initial state")
            case .ready(let list):
                self.datasource = CatalogTableViewDatasource(items: list, tableView: tableView)
                tableView.dataSource = datasource
                tableView.reloadData()
            default:
                print("default state")
            } 
        }
    }
    
    public var view: UIView {
        setupCodeView()
        return self
    }
    
    
    fileprivate lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Click Me", for: .normal)
        view.backgroundColor = .red
        view.setTitleColor(.white, for: .normal)
        view.addTarget(self, action: #selector(didClickMe), for: .touchUpInside)
        return view
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.rowHeight = 80
        view.delegate = self
        return view
    }()
    
    public init(delegate: CatalogScreenDelegate) {
        self.delegate = delegate
        self.currentState = .initial
        super.init(frame: .zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CatalogScreen {
    @objc
    func didClickMe() {
        delegate?.didClickMe()
    }
}

extension CatalogScreen: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(at: indexPath.row)
    }
}

extension CatalogScreen: CodeView {
    func buildViewHierarchy() {
        addSubview(tableView)
        addSubview(button)
    }
    
    func buildConstraints() {
        tableView.snp.makeConstraints { make in
            make.left.top.right.equalTo(self)
            make.bottom.equalTo(button.snp.top).inset(10)
        }
        button.snp.makeConstraints { make in
            make.bottom.equalTo(self).inset(10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).inset(10)
            make.height.equalTo(44)
        }
    }
    
    func setupCustomConfiguration() {
        backgroundColor = .white
    }
}

