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
		
		let layout = makeLayout()
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		
		collectionView.delegate = context.coordinator
		collectionView.backgroundColor = .clear
		collectionView.register(UINib(nibName: FeedItemCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: FeedItemCollectionViewCell.reuseIdentifier)
		
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
	
	private func makeLayout() -> UICollectionViewCompositionalLayout {
		
		let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
		let item = NSCollectionLayoutItem(layoutSize: size)
		
		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(90))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
		
		let section = NSCollectionLayoutSection(group: group)
		section.interGroupSpacing = 10
		
		return UICollectionViewCompositionalLayout(section: section)
		
	}
	
}

struct FeedCollectionView_Previews: PreviewProvider {
	
	static let binding = Binding<[FeedItem]>.constant([.generate(), .generate(), .generate()])
	
    static var previews: some View {
		
		return FeedCollectionView(items: binding)
		
    }
	
}
