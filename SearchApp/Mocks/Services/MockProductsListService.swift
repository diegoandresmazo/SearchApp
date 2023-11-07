//
//  MockProductsListService.swift
//  SearchApp
//
//  Created by Diego Mazo on 7/11/23.
//

import Foundation
import Combine

class MockProductsListService: ProductsListServiceType {
	func getProducts(from query: String) -> AnyPublisher<[ProductListEntity], CloudError> {
		if query == "emptyQuery" {
			return Just([ProductListEntity]())
				.setFailureType(to: CloudError.self)
				.eraseToAnyPublisher()
		} else if query == "errorQuery" {
			return Fail(error: CloudError.unknow)
				.eraseToAnyPublisher()
		}
		
		return Just(MockProductListEntity.getProducts())
			.setFailureType(to: CloudError.self)
			.eraseToAnyPublisher()
	}
}
