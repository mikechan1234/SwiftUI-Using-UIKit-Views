//
//  FeedItemCollectionViewCell.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit

class FeedItemCollectionViewCell: UICollectionViewCell {

	static let reuseIdentifier = String(describing: FeedItemCollectionViewCell.self)
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var artistNameLabel: UILabel!

}

extension FeedItemCollectionViewCell {
	
	func configure(using feedItem: FeedItem) {
		
		titleLabel.text = feedItem.name
		artistNameLabel.text = feedItem.artistName
		
	}
	
}
