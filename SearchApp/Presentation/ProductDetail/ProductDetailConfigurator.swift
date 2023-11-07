//
//  ProductDetailConfigurator.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

import UIKit

/**
 * Te ProductDetail ViewController is configured with its respective presenter.
 */
public final class ProductDetailConfigurator {
	static func getViewController(
		for product: ProductListEntity,
		with apiService: APIServiceType,
		navigator: NavigatorType
	) -> UIViewController {
		let presenter = ProductDetailPresenter(
			product: product,
			productDetailService: ProductDetailService(apiService: apiService),
			navigator: navigator
		)
		
		let viewController = ProductDetailViewController(presenter: presenter)
		viewController.modalPresentationStyle = .fullScreen
		
		return viewController
	}
}
