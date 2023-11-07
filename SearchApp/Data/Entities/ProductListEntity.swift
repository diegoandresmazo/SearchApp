//
//  ProductListEntity.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

public struct ProductListEntity: Equatable {
	let id: String
	let availableQuantity: Int
	let condition: String
	let currencyId: String
	let price: Double
	let soldQuantity: Int
	let thumbnailLink: String
	let title: String
	var currency: CurrencyEntity?
	var detailInfo: ProductDetailEntity?
	let installments: InstallmentsEntity?
	
	public init(
		id: String,
		availableQuantity: Int,
		condition: String,
		currencyId: String,
		price: Double,
		soldQuantity: Int,
		thumbnailLink: String,
		title: String,
		currency: CurrencyEntity?,
		detailInfo: ProductDetailEntity? = nil,
		installments: InstallmentsEntity?
	) {
		self.id = id
		self.availableQuantity = availableQuantity
		self.condition = condition
		self.currencyId = currencyId
		self.price = price
		self.soldQuantity = soldQuantity
		self.thumbnailLink = thumbnailLink
		self.title = title
		self.currency = currency
		self.detailInfo = detailInfo
		self.installments = installments
	}
}
