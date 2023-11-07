//
//  Icons.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit

/**
 * Enumeration of icons used in the app.
 */
enum Icons {
	case error
	case heart
	case search
	
	private var systemImageName: String {
		switch self {
			case .error:
				return "exclamationmark.circle.fill"
			case .heart:
				return "suit.heart"
			case .search:
				return "magnifyingglass.circle.fill"
		}
	}
	
	var uiImage: UIImage {
		return UIImage(systemName: systemImageName)!
	}
}
