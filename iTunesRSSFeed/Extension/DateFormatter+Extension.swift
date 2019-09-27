//
//  DateFormatter+Extension.swift
//  iTunesRSSFeed
//
//  Created by Michael on 26/9/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation

extension DateFormatter {
	
//	"2019-07-26"
	static let shortDate: DateFormatter = {
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		
		return dateFormatter
		
	}()
	
}
