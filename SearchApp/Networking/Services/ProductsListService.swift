//
//  ProductsListService.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

import Foundation
import Combine

protocol ProductsListServiceType {
	func getProducts(from query: String) -> AnyPublisher<[ProductListEntity], CloudError>
}

class ProductsListService: ProductsListServiceType {
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
	 * A call is made to the API with the query and then a nested call is made to get the currency of the product.
	 */
	func getProducts(from query: String) -> AnyPublisher<[ProductListEntity], CloudError> {
		return search(for: query)
			.flatMap { searchEntity -> AnyPublisher<ProductListEntity, CloudError> in
				Publishers.Sequence(sequence: searchEntity.products)
					.eraseToAnyPublisher()
			}
			.flatMap { product in
				self.getCurrency(for: product.currencyId)
					.map { currency -> ProductListEntity in
						var updatedProduct = product
						updatedProduct.currency = currency
						
						return updatedProduct
					}
			}
			.collect()
			.eraseToAnyPublisher()
	}
	
	private func search(for query: String) -> AnyPublisher<SearchEntity, CloudError> {
		let urlString = APIConstants.searchBaseURL + query
		
		guard let url = URL(string: urlString) else {
			return Fail(error: CloudError.url(urlString: urlString))
				.eraseToAnyPublisher()
		}
		
		return apiService.call(
			URLRequest(url: url),
			urlSession: session,
			type: SearchAPI.self
		)
		.map { SearchWrapper.map(input: $0) }
		.eraseToAnyPublisher()
	}
	
	private func getCurrency(for currencyId: String) -> AnyPublisher<CurrencyEntity, CloudError> {
		let urlString = APIConstants.currenciesBaseURL + currencyId
		
		guard let url = URL(string: urlString) else {
			return Fail(error: CloudError.url(urlString: urlString))
				.eraseToAnyPublisher()
		}
		
		return apiService.call(
			URLRequest(url: url),
			urlSession: session,
			type: CurrencyAPI.self
		)
		.map { CurrencyWrapper.map(input: $0) }
		.eraseToAnyPublisher()
	}
}
