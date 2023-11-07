//
//  Navigator.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import Foundation
import UIKit

protocol NavigatorType {
	func start()
	func navigateToDetail(product: ProductListEntity)
}

/**
 * Navigator is an object used by Presenters to handle navigation to other controllers.
 */
public final class Navigator: NavigatorType {
	private let window: UIWindow
	private let rootNavigationController: UINavigationController
	private let apiService: APIServiceType
	
	public init(
		window: UIWindow,
		rootNavigationController: UINavigationController,
		apiService: APIServiceType
	) {
		self.apiService = apiService
		self.rootNavigationController = rootNavigationController
		self.window = window
	}

	public func start() {
		let productsListViewController = ProductsListConfigurator.getViewController(with: apiService, navigator: self)
		
		rootNavigationController.setViewControllers([productsListViewController], animated: false)
		rootNavigationController.setNavigationBarHidden(true, animated: false)
		
		window.rootViewController = rootNavigationController
		window.makeKeyAndVisible()
	}
	
	public func navigateToDetail(product: ProductListEntity) {
		let productDetailViewController = ProductDetailConfigurator.getViewController(for: product, with: apiService, navigator: self)
		
		rootNavigationController.setNavigationBarHidden(false, animated: false)
		rootNavigationController.pushViewController(productDetailViewController, animated: true)
	}
}
