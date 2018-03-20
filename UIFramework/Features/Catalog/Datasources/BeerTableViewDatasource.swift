//
//  BeerTableViewDatasource.swift
//  BeersApp
//
//  Created by thiago.lioy on 3/20/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import Foundation
import ModelsFramework

final class BeerTableViewDatasource: NSObject {
    
    let items: [Beer]
    
    init(items: [Beer], tableView: UITableView) {
        self.items = items
        super.init()
        registerCells(in: tableView)
    }
    
    func registerCells(in tableView: UITableView) {
        tableView.register(cellType: BeerTableViewCell.self)
    }
}

extension BeerTableViewDatasource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: BeerTableViewCell.self)
        let model = items[indexPath.row]
        cell.setup(with: model)
        return cell
    }
    
    
}
