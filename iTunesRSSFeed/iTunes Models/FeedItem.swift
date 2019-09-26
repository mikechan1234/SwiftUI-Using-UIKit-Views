//
//  FeedItem.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation

struct FeedItem: Codable, Identifiable {
	
	let artistName: String
	let id: String
	let releaseDate: Date
	let name: String
	let collectionName: String
	let kind: String
	let copyright: String
	let artistId: String
	let artistURL: URL
	let artistURL100: URL
	let genres: [Genre]
	let url: URL
	
}

//MARK: Hashable
extension FeedItem: Hashable {
	
	func hash(into hasher: inout Hasher) {
		
		hasher.combine(id)
		
	}
	
	static func == (lhs: FeedItem, rhs: FeedItem) -> Bool {
		
		lhs.id == rhs.id
		
	}
	
}
