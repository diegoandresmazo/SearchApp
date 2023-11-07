//
//  SellerAPI.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

public struct SellerAPI: Decodable {
	let id: Int
	let city: String
	let nickname: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case address
		case city
		case nickname
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let addressContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .address)
		
		id = try container.decode(Int.self, forKey: .id)
		city = try addressContainer.decode(String.self, forKey: .city)
		nickname = try container.decode(String.self, forKey: .nickname)
	}
}
