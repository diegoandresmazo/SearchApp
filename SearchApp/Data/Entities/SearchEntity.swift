//
//  SearchEntity.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

public struct SearchEntity: Equatable {
	let query: String
	let siteId: String
	let products: [ProductListEntity]
	
	public init(
		query: String,
		siteId: String,
		products: [ProductListEntity]
	) {
		self.query = query
		self.siteId = siteId
		self.products = products
	}
}
