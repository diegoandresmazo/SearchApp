//
//  SearchAPI.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

public struct SearchAPI: Codable {
	public let query: String
	public let site_id: String
	public let products: [ProductListAPI]
	
	enum CodingKeys: String, CodingKey {
		case query
		case site_id
		case products = "results"
	}
}
