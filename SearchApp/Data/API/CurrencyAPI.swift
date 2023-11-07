//
//  CurrencyAPI.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

public struct CurrencyAPI: Codable {
	let id: String
	let decimalPlaces: Int
	let description: String
	let symbol: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case decimalPlaces = "decimal_places"
		case description
		case symbol
	}
}
