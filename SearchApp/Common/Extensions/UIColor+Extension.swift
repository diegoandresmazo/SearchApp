//
//  UIColor+Extension.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import Foundation
import UIKit

extension UIColor {
	
	/**
	 * Function to convert color strings in hexadecimal format to UIColor.
	 */
	convenience init?(hexString: String) {
		var cleanedString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
		
		if cleanedString.hasPrefix("#") {
			cleanedString.remove(at: cleanedString.startIndex)
		}
		
		guard cleanedString.count == 6, let rgbValue = UInt32(cleanedString, radix: 16) else {
			return nil
		}
		
		let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
		let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
		let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
		let alpha = CGFloat(1.0)
		
		self.init(
			red: red,
			green: green,
			blue: blue,
			alpha: alpha
		)
	}
}
