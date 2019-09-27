//
//  Feed.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation

//{
//  "feed": {
//    "title": "Top Songs",
//    "id": "https://rss.itunes.apple.com/api/v1/gb/apple-music/top-songs/all/1/explicit.json",
//    "author": {
//      "name": "iTunes Store",
//      "uri": "http://wwww.apple.com/gb/itunes/"
//    },
//    "links": [
//      {
//        "self": "https://rss.itunes.apple.com/api/v1/gb/apple-music/top-songs/all/1/explicit.json"
//      },
//      {
//        "alternate": "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop?genreId=34&popId=81&app=music"
//      }
//    ],
//    "copyright": "Copyright © 2018 Apple Inc. All rights reserved.",
//    "country": "gb",
//    "icon": "http://itunes.apple.com/favicon.ico",
//    "updated": "2019-09-25T01:57:26.000-07:00",
//    "results": [
//      {
//        "artistName": "Regard",
//        "id": "1472026722",
//        "releaseDate": "2019-07-26",
//        "name": "Ride It",
//        "collectionName": "Ride It - Single",
//        "kind": "song",
//        "copyright": "℗ 2019 Ministry of Sound Recordings Limited",
//        "artistId": "951024217",
//        "artistUrl": "https://music.apple.com/gb/artist/regard/951024217?app=music",
//        "artworkUrl100": "https://is2-ssl.mzstatic.com/image/thumb/Music123/v4/61/bf/01/61bf0139-35c7-8f06-432d-9e7d316fba32/886447846674.jpg/200x200bb.png",
//        "genres": [
//          {
//            "genreId": "17",
//            "name": "Dance",
//            "url": "https://itunes.apple.com/gb/genre/id17"
//          },
//          {
//            "genreId": "34",
//            "name": "Music",
//            "url": "https://itunes.apple.com/gb/genre/id34"
//          }
//        ],
//        "url": "https://music.apple.com/gb/album/ride-it/1472026375?i=1472026722&app=music"
//      }
//    ]
//  }
//}

struct Feed: Codable, Identifiable {
	
	let title: String
	let id: URL
	let author: Author
	let links: [Link]
	let copyright: String
	let country: String
	let icon: URL
	let updated: Date
	let results: [FeedItem]
	
}

//MARK: Hashable
extension Feed: Hashable {
	
	func hash(into hasher: inout Hasher) {
		
		hasher.combine(id)
		
	}
	
	static func == (lhs: Feed, rhs: Feed) -> Bool {
		
		lhs.id == rhs.id
		
	}
	
}

extension Feed {
		
	static func generate() -> Feed {
		
		Feed(title: "Test", id: URL(string: "https://google.com")!, author: .generate(), links: [], copyright: .randomAlphaNumericString(), country: .randomAlphaNumericString(length: 4), icon: URL(string: "https://google.com")!, updated: Date(), results: (0..<10).map {_ in
			
			FeedItem.generate()
						
		})
		
	}
	
}
