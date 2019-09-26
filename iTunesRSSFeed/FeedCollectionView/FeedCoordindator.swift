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
	
	var parent: FeedCollectionView
	private var bindingCancellable: AnyCancellable?
	
	var dataSource: UICollectionViewDiffableDataSource<FeedCollectionViewSection, FeedItem>
	
	init(_ feedCollectionView: FeedCollectionView) {
		
		parent = feedCollectionView
		
		dataSource = UICollectionViewDiffableDataSource(collectionView: parent.collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
			
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedItemCollectionViewCell.reuseIdentifier, for: indexPath) as? FeedItemCollectionViewCell else {
				
				return nil
				
			}
			
			return cell
						
		})
		
		super.init()
		
		bindingCancellable = parent.items.publisher.sink(receiveValue: {[unowned self] (feedItem) in
			
			var snapshot = self.dataSource.snapshot()
			snapshot.appendItems([feedItem])
			
			self.dataSource.apply(snapshot, animatingDifferences: true)
			
		})
		
		
		var currentSnapshot = NSDiffableDataSourceSnapshot<FeedCollectionViewSection, FeedItem>()
		
		currentSnapshot.appendSections([.main])
		currentSnapshot.appendItems(feedCollectionView.items, toSection: .main)

		dataSource.apply(currentSnapshot, animatingDifferences: false)
		
	}
	
}

//MARK: UICollectionViewDelegateFlowLayout
extension FeedCoordindator: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		CGSize(width: collectionView.bounds.width, height: 90)
		
	}
	
}
