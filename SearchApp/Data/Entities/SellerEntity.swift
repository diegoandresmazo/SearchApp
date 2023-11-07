//
//  SellerEntity.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

public struct SellerEntity: Equatable {
	let id: Int
	let addressCity: String
	let nickname: String
	
	public init(
		id: Int,
		addressCity: String,
		nickname: String
	) {
		self.id = id
		self.addressCity = addressCity
		self.nickname = nickname
	}
}
