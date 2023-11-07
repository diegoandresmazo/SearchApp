//
//  ProductsListTableViewManager}.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit
import OSLog

public protocol BaseTableViewControllerDelegate: AnyObject {
	func cellPressed(for position: Int)
}


/**
 * This class is a base to create any TableViewController in the app in a generic way.
 */
class BaseTableViewController<Section: TableViewSectionModel, Cell: UITableViewCell>: NSObject, TableViewManagerType where Cell: ConfigurableCell {
	var tableView: UITableView
	weak var delegate: BaseTableViewControllerDelegate?
	
	var sections: [Section] = [] {
		didSet {
			updateDataSource()
		}
	}
	
	public init(
		tableView: UITableView,
		sections: [Section]
	) {
		self.tableView = tableView
		self.sections = sections
		
		super.init()
		
		initialSetup()
	}
		
	private func initialSetup() {
		tableView.register(
			Cell.self,
			forCellReuseIdentifier: Cell.reuseIdentifier
		)
		
		tableView.dataSource = self
		tableView.delegate = self
		
		updateDataSource()
	}
	
	private func updateDataSource() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
			
			if !self.sections.isEmpty {
				self.tableView.scrollToRow(
					at: IndexPath(row: 0, section: 0),
					at: UITableView.ScrollPosition.top,
					animated: false
				)
			}
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return sections.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if sections.count == 0 {
			return 0
		}
		
		return sections[section].data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
			Logger.baseTableView.error("Error getting cell: \(Cell.reuseIdentifier)")
			
			return UITableViewCell()
		}
		
		cell.configure(with: sections[indexPath.section].data[indexPath.row])
		
		return cell as UITableViewCell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		delegate?.cellPressed(for: indexPath.row)
	}
}
