//
//  Fonts.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit

/**
 * Enumeration of fonts used in the app.
 */
enum Fonts {
	case heavy
	case light
	case main
	
	private var fontName: String {
		switch self {
			case .heavy:
				return "Avenir-Heavy"
			case .light:
				return "Avenir-Light"
			case .main:
				return "Avenir-Roman"
		}
	}
	
	func uiFont(withSize size: CGFloat) -> UIFont {
		return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
	}
}
