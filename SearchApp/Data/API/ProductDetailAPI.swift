//
//  ProductDetailAPI.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

/**
 * In ProductDetailIAPI extra information for the product is obtained, such as a new image with better resolution and the seller's identifier to later get the seller's data.
 */
public struct ProductDetailAPI: Codable {
	let sellerId: Int
	let thumbnailLink: String
	let imagesLinks: [ProductDetailPictureAPI]
	
	enum CodingKeys: String, CodingKey {
		case sellerId = "seller_id"
		case thumbnailLink = "thumbnail"
		case imagesLinks = "pictures"
	}
}

public struct ProductDetailPictureAPI: Codable {
	let url: String
}
