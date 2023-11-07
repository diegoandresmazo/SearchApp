//
//  ProductDetailEntity.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

public struct ProductDetailEntity: Equatable {
	let imageLink: String
	let sellerId: Int
	var seller: SellerEntity?
	
	public init(
		imageLink: String,
		sellerId: Int,
		seller: SellerEntity?
	) {
		self.imageLink = imageLink
		self.sellerId = sellerId
		self.seller = seller
	}
}
