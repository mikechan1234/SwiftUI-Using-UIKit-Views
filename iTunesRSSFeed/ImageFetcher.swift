//
//  ImageFetcher.swift
//  iTunesRSSFeed
//
//  Created by Michael on 30/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit
import Combine

class ImageFetcher {
	
	static let current = ImageFetcher()
	
	private let imageDownloadQueue = DispatchQueue(label: "com.michael.iTunesRSSFeed", qos: .utility, attributes: .concurrent)
	private let session: URLSession
	private let cache: NSCache<NSString, NSData>
	
	private init(session: URLSession = URLSession(configuration: .default), cache: NSCache<NSString, NSData> = NSCache<NSString, NSData>()) {
	
		self.session = session
		self.cache = cache
		
	}
	
	@discardableResult
	func image(at url: URL, completion: ((UIImage?)->())? = nil) -> AnyCancellable? {
	
		if let data = cache.object(forKey: url.absoluteString as NSString) {
			
			completion?(UIImage(data: data as Data))
			return nil
			
		} else {
			
			return session.dataTaskPublisher(for: url).map { (data, response) -> Data in
				
				data
				
			}.compactMap {[weak self] (data) -> UIImage? in
				
				self?.cache.setObject(data as NSData, forKey: url.absoluteString as NSString)

				return UIImage(data: data)
				
			}.subscribe(on: imageDownloadQueue).receive(on: DispatchQueue.main).sink(receiveCompletion: { _ in
				
			}) { (image) in
				
				completion?(image)
				
			}
			
		}
		
	}
	
}
