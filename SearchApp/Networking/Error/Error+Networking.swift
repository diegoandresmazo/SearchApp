//
//  Error+Networking.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

import Foundation

public enum CloudError: Error {
	case decode(error: Error)
	case server(error: Error)
	case url(urlString: String)
	case unknow
	
	public var errorDescription: String {
		switch self {
			case .decode(let error):
				return "Unable to parse JSON, error: \(error)"
			case .server(let error):
				return "API Server error: \(error)"
			case .url(let urlString):
				return "Error creating URL: \(urlString)"
			case .unknow:
				return "Unknow error"
		}
	}
}
