//
//  MockProductsListViewController.swift
//  SearchApp
//
//  Created by Diego Mazo on 7/11/23.
//

import Foundation

final class MockProductsListViewController: ProductsListViewControllerType {
	var viewStatus: ProductsViewStatus = .showLoadingSearch
	var products: [ProductListEntity]? = nil
	
	func show(_ productViewStatus: ProductsViewStatus,
			  products: [ProductListEntity]?
	) {
		self.viewStatus = productViewStatus
		self.products = products
	}
	
	func cellPressed(for position: Int) {}
}
