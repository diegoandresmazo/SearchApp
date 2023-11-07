//
//  MockProductListEntity.swift
//  SearchApp
//
//  Created by Diego Mazo on 7/11/23.
//

import Foundation

class MockProductListEntity {
	static func getProducts() -> [ProductListEntity] {
		[
			ProductListEntity(
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
			),
			ProductListEntity(
				id: "2",
				availableQuantity: 20,
				condition: "used",
				currencyId: "COP",
				price: 439000,
				soldQuantity: 10,
				thumbnailLink: "thumbnail_2",
				title: "iPhone 13 Pro",
				currency: nil,
				installments: nil
			),
			ProductListEntity(
				id: "3",
				availableQuantity: 100,
				condition: "new",
				currencyId: "COP",
				price: 569000,
				soldQuantity: 40,
				thumbnailLink: "thumbnail_3",
				title: "iPhone 15",
				currency: nil,
				installments: nil
			)
		]
	}
}
