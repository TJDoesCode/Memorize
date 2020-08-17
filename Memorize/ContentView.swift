//
//  ContentView.swift
//  Memorize
//
//  Created by Trevor Reigh on 8/7/20.
//  Copyright © 2020 Trevor Reigh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel: EmojiMemoryGame
	
    var body: some View {
		VStack {
			Button(action: { self.viewModel.newGame() }) {
				Text("New Game")
			}
			GameView(viewModel: viewModel)
		}
	}
}


struct GameView: View {
	@ObservedObject var viewModel: EmojiMemoryGame
	
	var body: some View {
		VStack {
			Grid(viewModel.cards) { card in
				CardView(card: card).onTapGesture {
					self.viewModel.choose(card: card)
				}
				.padding(5)
			}
			.padding()
			.foregroundColor(self.viewModel.color)
			.navigationBarHidden(true)
			ScoreView(score: viewModel.score)
		}
	}
}

struct CardView: View {
	var card: MemoryGame<String>.Card
	
	var body: some View {
		GeometryReader { geometry in
			self.body(geometry.size)
		}
	}
	
	private func body(_ size: CGSize) -> some View {
		ZStack {
			if card.isFaceUp {
				RoundedRectangle(cornerRadius: cornerRadius)
					.fill(Color.white)
				RoundedRectangle(cornerRadius: cornerRadius)
					.stroke(lineWidth: edgeLineWidth)
				Text(card.content)
			} else {
				if !card.isMatched {
					RoundedRectangle(cornerRadius: cornerRadius)
						.fill()
				}
			}
		}
		.font(Font.system(size: fontSize(size)))
	}
	
	//MARK: - Drawing Constants
	
	private let cornerRadius: CGFloat = 10.0
	private let edgeLineWidth: CGFloat = 3.0
	private func fontSize(_ size: CGSize) -> CGFloat {
		min(size.width, size.height) * 0.75
	}
}

struct ScoreView: View {
	var score: Int
	
	var body: some View {
		HStack{
			Spacer()
			Text("Score: \(score)")
			Spacer()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(viewModel: EmojiMemoryGame())
    }
}
