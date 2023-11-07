//
//  Colors.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit

/**
 * Enumeration of colors used in the app.
 */
enum Colors {
	case background
	case blue
	case detailContainer
	case gray
	case green
	case lightGray
	case main
	case mediumGray
	
	private var hexString: String {
		switch self {
			case .background:
				return "e1e1e2"
			case .blue:
				return "0873c4"
			case .detailContainer:
				return "ebebeb"
			case .gray:
				return "3c3c3c"
			case .green:
				return "008f39"
			case .lightGray:
				return "bdbdbd"
			case .main:
				return "ffe600"
			case .mediumGray:
				return "848484"
		}
	}
	
	var uiColor: UIColor? {
		return UIColor(hexString: self.hexString)
	}
}
