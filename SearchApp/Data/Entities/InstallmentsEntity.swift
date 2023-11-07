//
//  InstallmentsEntity.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

public struct InstallmentsEntity: Equatable {
	let amount: Double
	let currencyId: String
	let quantity: Int
	let rate: Int
	
	public init(
		amount: Double,
		currencyId: String,
		quantity: Int,
		rate: Int
	) {
		self.amount = amount
		self.currencyId = currencyId
		self.quantity = quantity
		self.rate = rate
	}
}
