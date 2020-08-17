//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Trevor Reigh on 8/7/20.
//  Copyright © 2020 Trevor Reigh. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
	@Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
	private static var theme: CardTheme = themeData.randomElement()!
	
	private static func createMemoryGame() -> MemoryGame<String> {
		let emoji: Array<String> = theme.cards
		return MemoryGame<String>(numPairs: emoji.count) { i in
			return emoji[i]
		}
	}
	
	func newGame() {
		EmojiMemoryGame.theme = themeData.randomElement()!
		game = EmojiMemoryGame.createMemoryGame()
	}
	
	//MARK: - Access to the Model
	var cards: Array<MemoryGame<String>.Card> {
		game.cards
	}
	
	var score: Int {
		game.score
	}
	
	var color: Color {
		let theme = EmojiMemoryGame.theme
		//Convert RGB values to ratio values
		let colors = theme.color.map({value in
			return value/255
		})
		return(Color(.sRGB, red: colors[0], green: colors[1], blue: colors[2], opacity: 1))
	}
	
	//MARK: - Intent(s)
	
	func choose(card: MemoryGame<String>.Card) {
		game.choose(card: card)
	}
}
