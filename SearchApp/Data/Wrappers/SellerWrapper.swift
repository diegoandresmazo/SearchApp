//
//  SellerWrapper.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

struct SellerWrapper {
	static func map(input: SellerAPI) -> SellerEntity {
		return SellerEntity(
			id: input.id,
			addressCity: input.city,
			nickname: input.nickname
		)
	}
}
