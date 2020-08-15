//
//  MemoryGame.swift
//  Memorize
//
//  Created by Trevor Reigh on 8/7/20.
//  Copyright © 2020 Trevor Reigh. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
	var cards: Array<Card>
	var score = 0
	
	var faceUpIndex: Int? {
		get { cards.indices.filter { cards[$0].isFaceUp }.only }
		set {
			for index in cards.indices {
				cards[index].isFaceUp = index == newValue
			}
		}
	}
	
	init(numPairs: Int, cardContentFactory: (Int) -> CardContent) {
		var arr = Array<Card>()
		for i in 0..<numPairs {
			let content = cardContentFactory(i)
			arr.append(Card(id: i*2, content: content))
			arr.append(Card(id: i*2+1, content: content))
		}
		cards = arr.shuffled()
	}
	
	mutating func choose(card: Card) {
		if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
			if let potentialMatchIndex = faceUpIndex {
				if cards[chosenIndex].content == cards[potentialMatchIndex].content {
					cards[chosenIndex].isMatched = true
					cards[potentialMatchIndex].isMatched = true
					score += 2
				} else {
					score -= 1
				}
				self.cards[chosenIndex].isFaceUp = true
			} else {
				faceUpIndex = chosenIndex
			}
		}
	}
	
	struct Card: Identifiable {
		var id: Int
		var isFaceUp: Bool = false
		var isMatched: Bool = false
		var content: CardContent
	}
}
