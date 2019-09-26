//
//  ContentViewModel.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation

class ContentViewModel: ObservableObject {
	
	let urlSession = URLSession(configuration: .default)
	@Published var items: [FeedItem] = []
	
}

extension ContentViewModel {
	
	func getFeed() {
		
		guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/gb/apple-music/top-songs/all/10/explicit.json") else {
			return
		}
		
		_ = urlSession.dataTaskPublisher(for: url).map { (data, response) -> Data in
			
			data
			
		}.tryMap { (data) -> Feed in

			let jsonDecoder = JSONDecoder()
			jsonDecoder.dateDecodingStrategy = .custom(JSONDecoder.DateDecodingStrategy.feed)
			
			return try jsonDecoder.decode(Feed.self, from: data)

		}.map { (feed) -> [FeedItem] in
			
			feed.results
			
		}.append(items).sink(receiveCompletion: { (completion) in
			
			switch completion {
				
			case .failure(_):
				break
			
			case .finished:
				break
				
			}
			
		}) {[unowned self] (items) in
			
			self.items = items
			
		}
		
	}
	
}
