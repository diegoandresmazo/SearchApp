//
//  MockProductDetailService.swift
//  SearchApp
//
//  Created by Diego Mazo on 7/11/23.
//

import Foundation
import Combine

class MockProductDetailService: ProductDetailServiceType {
	func getProductDetailInfo(for productId: String) -> AnyPublisher<ProductDetailEntity, CloudError> {
		return Just(MockProductDetailEntity.getProductDetailEntity())
			.setFailureType(to: CloudError.self)
			.eraseToAnyPublisher()
	}
}
