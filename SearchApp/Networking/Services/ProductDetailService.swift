//
//  ProductDetailService.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

import Foundation
import Combine

protocol ProductDetailServiceType {
	func getProductDetailInfo(for productId: String) -> AnyPublisher<ProductDetailEntity, CloudError>
}

class ProductDetailService: ProductDetailServiceType {
	private let apiService: APIServiceType
	private let session: URLSession
	
	init(
		apiService: APIServiceType,
		urlSession: URLSession = .shared
	) {
		self.apiService = apiService
		self.session = urlSession
	}
	
	/**
	 * A call is made to the API with the productId and then a nested call is made to get the seller object of the product.
	 */
	func getProductDetailInfo(for productId: String) -> AnyPublisher<ProductDetailEntity, CloudError> {
		let urlString = APIConstants.productDetailBaseURL + productId
		
		guard let url = URL(string: urlString) else {
			return Fail(error: CloudError.url(urlString: urlString))
				.eraseToAnyPublisher()
		}
		
		let request = URLRequest(url: url)
		
		return apiService.call(
			request,
			urlSession: session,
			type: ProductDetailAPI.self
		)
		.map { ProductDetailWrapper.map(input: $0) }
		.flatMap { productDetail in
			self.getSeller(for: productDetail.sellerId)
				.map { seller -> ProductDetailEntity in
					var updatedProductDetail = productDetail
					updatedProductDetail.seller = seller
					
					return updatedProductDetail
				}
		}
		.eraseToAnyPublisher()
	}
	
	private func getSeller(for sellerId: Int) -> AnyPublisher<SellerEntity, CloudError> {
		let urlString = APIConstants.sellerBaseURL + String(sellerId)
		
		guard let url = URL(string: urlString) else {
			return Fail(error: CloudError.url(urlString: urlString))
				.eraseToAnyPublisher()
		}
		
		let request = URLRequest(url: url)
		
		return apiService.call(
			request,
			urlSession: session,
			type: SellerAPI.self
		)
		.map { SellerWrapper.map(input: $0) }
		.eraseToAnyPublisher()
	}
}
