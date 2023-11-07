//
//  InstallmentsWrapper.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

struct InstallmentsWrapper {
	static func map(input: InstallmentsAPI) -> InstallmentsEntity {
		return InstallmentsEntity(
			amount: input.amount,
			currencyId: input.currencyId,
			quantity: input.quantity,
			rate: input.rate
		)
	}
}
