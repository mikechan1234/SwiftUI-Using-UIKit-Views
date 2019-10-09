//
//  FeedCoordindator.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation
import UIKit
import Combine

class FeedCoordindator: NSObject {

	var dataSource: UICollectionViewDiffableDataSource<FeedCollectionViewSection, FeedItem>!
	unowned var application: UIApplication
	
	init(_ application: UIApplication = .shared) {
		
		self.application = application
		
		super.init()
		
	}
	
	func applySnapshot(using items: [FeedItem], animated: Bool) {
		
		var currentSnapshot = NSDiffableDataSourceSnapshot<FeedCollectionViewSection, FeedItem>()
		
		currentSnapshot.appendSections([.main])
		currentSnapshot.appendItems(items, toSection: .main)

		dataSource.apply(currentSnapshot, animatingDifferences: animated)
		
	}
	
}

//MARK: UICollectionViewDelegate
extension FeedCoordindator: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	
		let feedItem = dataSource.itemIdentifier(for: indexPath)
		
		guard let url = feedItem?.url else {
			return
		}
		
		application.open(url, options: [:], completionHandler: nil)
		
	}
	
}
