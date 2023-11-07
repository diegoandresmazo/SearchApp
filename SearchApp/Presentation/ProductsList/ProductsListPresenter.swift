//
//  ProductsListPresenter.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import Combine
import Foundation
import UIKit
import OSLog

final class ProductsListPresenter {
	weak var view: ProductsListViewControllerType?
	
	private var navigator: NavigatorType
	private var productsListService: ProductsListServiceType
	private var products = [ProductListEntity]()
	
	private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()
	
	init(
		productsListService: ProductsListServiceType,
		navigator: NavigatorType
	) {
		self.productsListService = productsListService
		self.navigator = navigator
	}
	
	func viewDidLoad() {}
}

extension ProductsListPresenter: ProductsListPresenterType {
	func getProducts(for query: String) {
		self.view?.show(.showLoadingSearch, products: nil)
		
		productsListService.getProducts(from: query)
			.sink { [weak self] errorCompletion in
				if case .failure(let err) = errorCompletion {
					Logger.api.error("API related error: \(err.errorDescription)")
					
					self?.view?.show(.showError, products: nil)
				}
			} receiveValue: { [weak self] products in
				if products.isEmpty {
					self?.view?.show(.showNotResults, products: nil)
				} else {
					self?.products = products
					self?.view?.show(.showProducts, products: products)
				}
			}
			.store(in: &cancellable)
	}
	
	func openDetailProduct(for position: Int) {
		let productSelected = products[position]
		
		navigator.navigateToDetail(product: productSelected)
	}
}
