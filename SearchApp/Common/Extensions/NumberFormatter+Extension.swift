//
//  NumberFormatter+Extension.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

import Foundation

extension NumberFormatter {
	static func numberFormatter(for currency: CurrencyEntity) -> NumberFormatter {
		let numberFormatter = NumberFormatter()
		
		numberFormatter.numberStyle = .currency
		numberFormatter.currencySymbol = currency.symbol
		numberFormatter.minimumFractionDigits = currency.decimalPlaces
		
		return numberFormatter
	}
}
