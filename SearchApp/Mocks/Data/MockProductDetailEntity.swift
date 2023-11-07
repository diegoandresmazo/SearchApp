//
//  MockProductDetailEntity.swift
//  SearchApp
//
//  Created by Diego Mazo on 7/11/23.
//

import Foundation

class MockProductDetailEntity {
	static func getProdutWithoutDetailInfo() -> ProductListEntity {
		return ProductListEntity(
			id: "1",
			availableQuantity: 10,
			condition: "new",
			currencyId: "COP",
			price: 289000,
			soldQuantity: 3,
			thumbnailLink: "thumbnail_1",
			title: "iPhone 11",
			currency: nil,
			installments: nil
		)
	}
	
	static func getProductDetailEntity() -> ProductDetailEntity {
		return ProductDetailEntity(
			imageLink: "image_1",
			sellerId: 146991177,
			seller: SellerEntity(
				id: 146991177,
				addressCity: "Funza",
				nickname: "FSL SOLUCIONES"
			)
		)
	}
}
