//
//  Logger+Extension.swift
//  SearchApp
//
//  Created by Diego Mazo on 7/11/23.
//

import OSLog

/**
 * In this extension Loggers are creating to handle logs in the App..
 */
extension Logger {
	private static var subsystem = Bundle.main.bundleIdentifier!
	
	static let api = Logger(subsystem: subsystem, category: "APIError")
	static let baseTableView = Logger(subsystem: subsystem, category: "BaseTableView")
	static let kingfisher = Logger(subsystem: subsystem, category: "kingfisher")
}
