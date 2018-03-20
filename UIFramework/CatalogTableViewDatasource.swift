//
//  CatalogTableViewDatasource.swift
//  UIFramework
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation

final class CatalogTableViewDatasource: NSObject {
    
    let items: [CatalogTableViewCellModel]
    
    init(items: [CatalogTableViewCellModel], tableView: UITableView) {
        self.items = items
        super.init()
        registerCells(in: tableView)
    }
    
    func registerCells(in tableView: UITableView) {
        tableView.register(cellType: CatalogTableViewCell.self)
    }
}

extension CatalogTableViewDatasource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CatalogTableViewCell.self)
        let model = items[indexPath.row]
        cell.setup(with: model)
        return cell
    }
    
    
}
