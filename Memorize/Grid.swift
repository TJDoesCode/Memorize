//
//  Grid.swift
//  Memorize
//
//  Created by Trevor Reigh on 8/8/20.
//  Copyright © 2020 Trevor Reigh. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
	private var items: [Item]
	private var viewForItem: (Item) -> ItemView
	
	init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
		self.items = items
		self.viewForItem = viewForItem
	}
	
    var body: some View {
		GeometryReader { geo in
			self.body(GridLayout(itemCount: self.items.count, in: geo.size))
		}
	}
		
	private func body(_ layout: GridLayout) -> some View {
		ForEach(items) { item in
			self.body(for: item, in: layout)
		}
	}
	
	func body(for item: Item, in layout: GridLayout) -> some View {
		let index = items.firstIndex(matching: item)!
		return viewForItem(item)
				.frame(width: layout.itemSize.width, height: layout.itemSize.height)
				.position(layout.location(ofItemAt: index))
	}
}
