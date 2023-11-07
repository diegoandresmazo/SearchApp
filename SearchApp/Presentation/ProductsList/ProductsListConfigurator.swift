//
//  ProductsListConfigurator.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit

/**
 * Te ProductsList ViewController is configured with its respective presenter.
 */
public final class ProductsListConfigurator {
	static func getViewController(
		with apiService: APIServiceType,
		navigator: NavigatorType
	) -> UIViewController {
		let presenter = ProductsListPresenter(
			productsListService: ProductsListService(apiService: apiService),
			navigator: navigator
		)
		
		let viewController = ProductsListViewController(presenter: presenter)
		viewController.modalPresentationStyle = .fullScreen
		
		return viewController
	}
}
