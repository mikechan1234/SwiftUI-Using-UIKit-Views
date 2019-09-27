//
//  Genre.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation

struct Genre: Codable {
	
	let genreId: String
	let name: String
	let url: URL
	
}

//MARK: Generate
extension Genre {
	
	static func generate() -> Genre {
		
		Genre(genreId: .randomAlphaNumericString(length: 20), name: .randomAlphaNumericString(length: 10), url: URL(string: "https://google.com")!)
		
	}
	
}
