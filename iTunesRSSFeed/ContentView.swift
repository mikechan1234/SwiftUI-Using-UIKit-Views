//
//  ContentView.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@ObservedObject var viewModel: ContentViewModel
	
    var body: some View {
		
		FeedCollectionView(items: $viewModel.items).navigationBarTitle("Music Feed").onAppear {
			
			self.viewModel.getFeed()
			
		}
		
    }
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			ContentView(viewModel: ContentViewModel())
		}
    }
}
