//
//  ProductsListTableViewCellModel.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import Foundation

public struct ProductsListTableViewSectionModel: TableViewSectionModel {
	typealias Item = ProductsListTableViewCellModel
	
	var title: String
	var data: [ProductsListTableViewCellModel]
}

public struct ProductsListTableViewCellModel: Equatable {
	var name: String
	var price: Double
	var thumbnailLink: String
	var currency: CurrencyEntity?
	var installments: InstallmentsEntity?
}
