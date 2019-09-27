//
//  Author.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation

struct Author: Codable {
	
	let name: String
	let uri: URL
	
}

//MARK: Generate
extension Author {
	
	static func generate() -> Author {
		
		Author(name: .randomAlphaNumericString(length: 10), uri: URL(string: "https://google.com")!)
		
	}
	
}

