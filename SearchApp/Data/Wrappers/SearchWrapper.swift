//
//  SearchWrapeer.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

struct SearchWrapper {
	static func map(input: SearchAPI) -> SearchEntity {
		let products = input.products.map { ProductListWrapper.map(input: $0) }
		
		return SearchEntity(
			query: input.query,
			siteId: input.site_id,
			products: products
		)
	}
}
