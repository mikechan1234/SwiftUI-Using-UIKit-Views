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
	let artworkURL100: URL
	let genres: [Genre]
	let url: URL
	
	enum CodingKeys: String, CodingKey {
		
		case artistName
		case id
		case releaseDate
		case name
		case collectionName
		case kind
		case copyright
		case artistId
		case artistURL = "artistUrl"
		case artworkURL100 = "artworkUrl100"
		case genres
		case url
		
	}
	
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

//MARK: Generate
extension FeedItem {
	
	static func generate() -> FeedItem {
		
		FeedItem(artistName: .randomAlphaNumericString(length: 20), id: .randomAlphaNumericString(length: 20), releaseDate: Date(), name: .randomAlphaNumericString(length: 10), collectionName: .randomAlphaNumericString(), kind: .randomAlphaNumericString(length: 5), copyright: .randomAlphaNumericString(length: 10), artistId: .randomAlphaNumericString(length: 20), artistURL: URL(string: "https://google.com")!, artworkURL100: URL(string: "https://google.com")!, genres: [], url: URL(string: "https://google.com")!)
		
	}
	
}
