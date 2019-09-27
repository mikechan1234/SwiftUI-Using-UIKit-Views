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
		
		let flowLayout = UICollectionViewFlowLayout()
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		
		collectionView.backgroundColor = .clear
		collectionView.register(UINib(nibName: FeedItemCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: FeedItemCollectionViewCell.reuseIdentifier)
		collectionView.delegate = context.coordinator
		
		let dataSource = UICollectionViewDiffableDataSource<FeedCollectionViewSection, FeedItem>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
			
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedItemCollectionViewCell.reuseIdentifier, for: indexPath) as? FeedItemCollectionViewCell else {
				
				return nil
				
			}
			
			cell.configure(using: item)
			
			return cell
						
		})
		
		context.coordinator.dataSource = dataSource
		
		return collectionView
		
	}
	
	func updateUIView(_ uiView: UICollectionView, context: Context) {
		
		context.coordinator.applySnapshot(using: items, animated: false)
		
	}
	
	func makeCoordinator() -> FeedCoordindator {
		
		FeedCoordindator()
		
	}
	
}

struct FeedCollectionView_Previews: PreviewProvider {
	
	static let binding = Binding<[FeedItem]>.constant([.generate(), .generate(), .generate()])
	
    static var previews: some View {
		
		return FeedCollectionView(items: binding)
		
    }
	
}
