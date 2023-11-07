//
//  TableViewManagerType.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit

protocol TableViewManagerType: UITableViewDelegate, UITableViewDataSource {
	associatedtype Section: TableViewSectionModel
	
	var tableView: UITableView { get }
	var sections: [Section] { get }
}
