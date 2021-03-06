//
//  Data.swift
//  Memorize
//
//  Imports and decodes themeData.json, makes accessable
//
//  Created by Trevor Reigh on 8/15/20.
//  Copyright © 2020 Trevor Reigh. All rights reserved.
//

import Foundation

let themeData: Array<CardTheme> = load("themeData.json")

private func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
