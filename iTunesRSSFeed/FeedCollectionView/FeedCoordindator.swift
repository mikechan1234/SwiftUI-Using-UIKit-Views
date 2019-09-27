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
	
	func applySnapshot(using items: [FeedItem], animated: Bool) {
		
		var currentSnapshot = NSDiffableDataSourceSnapshot<FeedCollectionViewSection, FeedItem>()
		
		currentSnapshot.appendSections([.main])
		currentSnapshot.appendItems(items, toSection: .main)

		dataSource.apply(currentSnapshot, animatingDifferences: animated)
		
	}
	
}

//MARK: UICollectionViewDelegateFlowLayout
extension FeedCoordindator: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		CGSize(width: collectionView.bounds.width, height: 90)
		
	}
	
}
