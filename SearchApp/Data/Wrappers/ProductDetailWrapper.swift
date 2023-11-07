//
//  ProductDetailWrapper.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

struct ProductDetailWrapper {
	static func map(input: ProductDetailAPI) -> ProductDetailEntity {
		guard let imageLink = input.imagesLinks.first?.url else {
			return ProductDetailEntity(
				imageLink: input.thumbnailLink,
				sellerId: input.sellerId,
				seller: nil
			)
		}
		
		return ProductDetailEntity(
			imageLink: imageLink,
			sellerId: input.sellerId,
			seller: nil
		)
	}
}
