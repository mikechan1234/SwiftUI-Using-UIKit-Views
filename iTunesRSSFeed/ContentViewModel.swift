//
//  ContentViewModel.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
	
	let urlSession = URLSession(configuration: .default)
	@Published var items: [FeedItem] = [.generate()]
	
}

extension ContentViewModel {
	
	func getFeed() {
		
		guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/gb/apple-music/top-songs/all/10/explicit.json") else {
			return
		}
		
		_ = urlSession.dataTaskPublisher(for: url).map { (data, response) -> Data in
			
			data
			
		}.tryMap { (data) -> iTunesRSS in

			let jsonDecoder = JSONDecoder()
			jsonDecoder.dateDecodingStrategy = .custom(JSONDecoder.DateDecodingStrategy.feed)
			
			return try jsonDecoder.decode(iTunesRSS.self, from: data)

		}.map { (rss) -> [FeedItem] in
			
			rss.feed.results
			
		}.receive(on: DispatchQueue.main).sink(receiveCompletion: { (completion) in
			
			switch completion {
				
			case .failure(_):
				break
			
			case .finished:
				break
				
			}
			
		}) {[unowned self] (items) in
			
			self.items.append(contentsOf: items)
			
		}
		
	}
	
}
