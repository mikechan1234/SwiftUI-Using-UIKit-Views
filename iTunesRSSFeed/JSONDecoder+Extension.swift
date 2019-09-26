//
//  JSONDecoder+Extension.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {
	
	static let feed: (Decoder) throws -> Date = { decoder in
		
		let codingKey = decoder.codingPath.last
		let container = try decoder.singleValueContainer()
		let dateString = try container.decode(String.self)
		
		if codingKey?.stringValue == "updated", let date = ISO8601DateFormatter().date(from: dateString) {
			
			return date
								
		}
		
		guard let date = DateFormatter.shortDate.date(from: dateString) else {
			
			return Date()
			
		}
		
		return date
		
	}
	
}
