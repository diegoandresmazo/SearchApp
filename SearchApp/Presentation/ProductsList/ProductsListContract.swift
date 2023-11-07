//
//  ProductsListContract.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit

protocol ProductsListViewControllerType: BaseTableViewControllerDelegate {
	func show(_ productViewStatus: ProductsViewStatus, products: [ProductListEntity]?)
}

protocol ProductsListPresenterType: AnyObject {
	func getProducts(for query: String)
	func openDetailProduct(for position: Int)
}

protocol ProductsListViewType: UIView {
	var productsTableView: UITableView { get }
	var searchBar: UISearchBar { get }
	
	func setupView(for status: ProductsViewStatus)
}
