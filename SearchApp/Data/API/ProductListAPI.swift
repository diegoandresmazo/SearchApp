//
//  ProductListAPI.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

public struct ProductListAPI: Codable {
	let id: String
	let availableQuantity: Int
	let condition: String
	let currencyId: String
	let price: Double
	let soldQuantity: Int
	let thumbnailLink: String
	let title: String
	let installments: InstallmentsAPI?
	
	enum CodingKeys: String, CodingKey {
		case id
		case availableQuantity = "available_quantity"
		case condition
		case currencyId = "currency_id"
		case price
		case soldQuantity = "sold_quantity"
		case thumbnailLink = "thumbnail"
		case title
		case installments
	}
}
