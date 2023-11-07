//
//  CurrencyWrapper.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

struct CurrencyWrapper {
	static func map(input: CurrencyAPI) -> CurrencyEntity {
		return CurrencyEntity(
			id: input.id,
			decimalPlaces: input.decimalPlaces,
			description: input.description,
			symbol: input.symbol
		)
	}
}
