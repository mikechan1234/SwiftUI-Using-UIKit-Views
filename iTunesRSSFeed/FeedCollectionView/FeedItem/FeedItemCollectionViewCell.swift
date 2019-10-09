//
//  FeedItemCollectionViewCell.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit
import Combine

class FeedItemCollectionViewCell: UICollectionViewCell {

	static let reuseIdentifier = String(describing: FeedItemCollectionViewCell.self)
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var artistNameLabel: UILabel!
	
	weak var imageCancellable: AnyCancellable?
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		imageView.layer.cornerRadius = 2.0
		imageView.layer.masksToBounds = false
		
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		imageCancellable?.cancel()
		imageCancellable = nil
		
	}

}

extension FeedItemCollectionViewCell {
	
	func configure(using feedItem: FeedItem, imageFetcher: ImageFetcher = .current) {
		
		titleLabel.text = feedItem.name
		artistNameLabel.text = feedItem.artistName
		
		imageCancellable = imageFetcher.image(at: feedItem.artworkURL100) {[weak self] (image) in
			
			guard let artwork = image else {
				return
			}
			
			self?.imageView.image = artwork
			
		}
		
		
	}
	
}
