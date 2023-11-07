//
//  MockNavigator.swift
//  SearchApp
//
//  Created by Diego Mazo on 7/11/23.
//

import Foundation
import UIKit

final class MockNavigator: NavigatorType {
	private let window: UIWindow = UIWindow()
	private let rootNavigationController = UINavigationController()
	private let apiService: APIServiceType = APIService()
	
	func start() {

	}
	
	func navigateToDetail(product: ProductListEntity) {}
}
