//
//  ContentView.swift
//  Memorize
//
//  Created by Trevor Reigh on 8/7/20.
//  Copyright © 2020 Trevor Reigh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel: GameController
	
    var body: some View {
		ZStack {
			if !viewModel.inGame {
				NavigationView {
					List(themeData) { theme in
						NavigationLink(destination: GameView(viewModel: self.viewModel, theme: theme)) {
							Text(theme.name)
						}
					}
				.navigationBarTitle("Game Themes")
				}
			}
		}
    }
}

struct GameView: View {
	@ObservedObject var viewModel: EmojiMemoryGame
	var theme: CardTheme
	
	var body: some View {
		VStack {
			Grid(viewModel.cards) { card in
				CardView(card: card).onTapGesture {
					self.viewModel.choose(card: card)
				}
				.padding(5)
			}
			.padding()
			.foregroundColor(Color.orange)
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
	
	func body(_ size: CGSize) -> some View {
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
	
	let cornerRadius: CGFloat = 10.0
	let edgeLineWidth: CGFloat = 3.0
	func fontSize(_ size: CGSize) -> CGFloat {
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
		ContentView(viewModel: game)
    }
}
