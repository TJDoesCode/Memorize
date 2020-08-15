//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Trevor Reigh on 8/7/20.
//  Copyright © 2020 Trevor Reigh. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
	@Published public var inGame: Bool = false
	@Published private var game: MemoryGame<String>
		
	static func createMemoryGame(theme: CardTheme) -> MemoryGame<String> {
		let emoji: Array<String> = theme.cards
		return MemoryGame<String>(numPairs: emoji.count) { i in
			return emoji[i]
		}
	}
	
	init(theme: CardTheme) {
		game = EmojiMemoryGame.createMemoryGame(theme: theme)
	}
	
	//MARK: - Access to the Model
	var cards: Array<MemoryGame<String>.Card> {
		game.cards
	}
	
	var score: Int {
		game.score
	}
	
	//MARK: - Intent(s)
	
	func choose(card: MemoryGame<String>.Card) {
		game.choose(card: card)
	}
}
