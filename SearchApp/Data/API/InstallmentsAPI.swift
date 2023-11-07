//
//  InstallmentsAPI.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

public struct InstallmentsAPI: Codable {
	let amount: Double
	let currencyId: String
	let quantity: Int
	let rate: Int
	
	enum CodingKeys: String, CodingKey {
		case amount
		case currencyId = "currency_id"
		case quantity
		case rate
	}
}
