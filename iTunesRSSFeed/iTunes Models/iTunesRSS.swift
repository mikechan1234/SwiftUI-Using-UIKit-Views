//
//  iTunesRSS.swift
//  iTunesRSSFeed
//
//  Created by Michael on 27/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation

struct iTunesRSS: Codable {
	
	let feed: Feed
	
}

extension iTunesRSS {
	
	static func generate() -> iTunesRSS {
		
		iTunesRSS(feed: .generate())
		
	}
	
}
