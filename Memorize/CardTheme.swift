//
//  CardTheme.swift
//  Memorize
//
//  Card theme data schema
//
//  Created by Trevor Reigh on 8/15/20.
//  Copyright © 2020 Trevor Reigh. All rights reserved.
//

import Foundation
import SwiftUI

struct CardTheme: Identifiable, Decodable {
	var id: Int
	var name: String
	var numPairs: Int
	var color: Array<Double>
	var cards: Array<String>
}
