//
//  BeerCatalogScreen.swift
//  BeersApp
//
//  Created by thiago.lioy on 3/20/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation
import ModelsFramework
import UIFramework

protocol BeerCatalogScreenDelegate: class {
    func didClickMe()
    func didSelectItem(at index: Int)
}

final class BeerCatalogScreen: UIView {
    
    public weak var delegate: BeerCatalogScreenDelegate?
    private var datasource: BeerTableViewDatasource?
    
    public enum UIState {
        case initial
        case loading
        case ready([Beer])
        case emptySearch
        case error
    }
    
    public var currentState: UIState {
        didSet {
            switch currentState {
            case .initial:
                print("initial state")
            case .ready(let list):
                self.datasource = BeerTableViewDatasource(items: list, tableView: tableView)
                tableView.dataSource = datasource
                tableView.reloadData()
            default:
                print("default state")
            }
        }
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
    
    public init() {
        self.currentState = .initial
        super.init(frame: .zero)
        setupCodeView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BeerCatalogScreen {
    @objc
    func didClickMe() {
        delegate?.didClickMe()
    }
}

extension BeerCatalogScreen: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(at: indexPath.row)
    }
}

extension BeerCatalogScreen: CodeView {
    public func buildViewHierarchy() {
        addSubview(tableView)
        addSubview(button)
    }
    
    public func buildConstraints() {
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
    
    public func setupCustomConfiguration() {
        backgroundColor = .white
    }
}

