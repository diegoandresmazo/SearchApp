//
//  CurrencyEntity.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

public struct CurrencyEntity: Equatable {
	let id: String
	let decimalPlaces: Int
	let description: String
	let symbol: String
	
	public init(
		id: String,
		decimalPlaces: Int,
		description: String,
		symbol: String
	) {
		self.id = id
		self.decimalPlaces = decimalPlaces
		self.description = description
		self.symbol = symbol
	}
}
