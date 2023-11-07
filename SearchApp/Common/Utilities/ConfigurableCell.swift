//
//  ConfigurableCell.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

protocol ConfigurableCell {
	static var reuseIdentifier: String { get }
	func configure(with data: Any)
}

extension ConfigurableCell {
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}
