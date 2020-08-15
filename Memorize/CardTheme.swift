//
//  CardTheme.swift
//  Memorize
//
//  Created by Trevor Reigh on 8/15/20.
//  Copyright © 2020 Trevor Reigh. All rights reserved.
//

import Foundation

struct CardTheme: Identifiable, Decodable {
	var id: Int
	var name: String
	var numPairs: Int
	var cards: Array<String>
}
