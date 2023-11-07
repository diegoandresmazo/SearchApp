//
//  TableViewSectionModel.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit

protocol TableViewSectionModel {
	associatedtype Item

	var title: String { get }
	var data: [Item] { get }
}
