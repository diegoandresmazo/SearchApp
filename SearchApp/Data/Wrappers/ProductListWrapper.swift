//
//  ProductListWrapper.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

struct ProductListWrapper {
	static func map(input: ProductListAPI) -> ProductListEntity {
		guard let installmentsAPI = input.installments else {
			return ProductListEntity(
				id: input.id,
				availableQuantity: input.availableQuantity,
				condition: input.condition,
				currencyId: input.currencyId,
				price: input.price,
				soldQuantity: input.soldQuantity,
				thumbnailLink: input.thumbnailLink,
				title: input.title,
				currency: nil,
				installments: nil
			)
		}
		
		return ProductListEntity(
			id: input.id,
			availableQuantity: input.availableQuantity,
			condition: input.condition,
			currencyId: input.currencyId,
			price: input.price,
			soldQuantity: input.soldQuantity,
			thumbnailLink: input.thumbnailLink,
			title: input.title,
			currency: nil,
			installments: InstallmentsWrapper.map(input: installmentsAPI)
		)
	}
}
