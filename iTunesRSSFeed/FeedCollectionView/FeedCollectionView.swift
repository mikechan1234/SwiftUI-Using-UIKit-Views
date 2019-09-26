//
//  FeedCollectionView.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import SwiftUI
import UIKit

enum FeedCollectionViewSection {
	case main
}

struct FeedCollectionView: UIViewRepresentable {
	
	@Binding var items: [FeedItem]
	
	private(set) var collectionView: UICollectionView!
	
	func makeUIView(context: Context) -> UICollectionView {
		
		let collectionView = UICollectionView()
		let flowLayout = UICollectionViewFlowLayout()
		
		collectionView.collectionViewLayout = flowLayout
		collectionView.register(UINib(nibName: FeedItemCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: FeedItemCollectionViewCell.reuseIdentifier)
		collectionView.delegate = context.coordinator
		
		return collectionView
		
	}
	
	func updateUIView(_ uiView: UICollectionView, context: Context) {
		
		var currentSnapshot = NSDiffableDataSourceSnapshot<FeedCollectionViewSection, FeedItem>()
		
		currentSnapshot.appendSections([.main])
		currentSnapshot.appendItems(items, toSection: .main)

		context.coordinator.dataSource.apply(currentSnapshot, animatingDifferences: false)
		
	}
	
	func makeCoordinator() -> FeedCoordindator {
		
		FeedCoordindator(self)
		
	}
	
}

struct FeedCollectionView_Previews: PreviewProvider {
	
	static let binding = Binding<[FeedItem]>.constant([])

    static var previews: some View {
		FeedCollectionView(items: binding)
    }
}
