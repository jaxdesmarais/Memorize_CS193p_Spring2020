//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Desmarais, Jacque on 6/1/20.
//  Copyright © 2020 Desmarais, Jax. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojiThemeCollection = themes.randomElement()!
        let emojis = emojiThemeCollection.emojiCollection
        let numberOfPairs = emojiThemeCollection.numberOfCards ?? Int.random(in: 2...emojis.count)
                        
        return MemoryGame<String>(theme: emojiThemeCollection, numberOfPairsOfCards: numberOfPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    var color: Color {
        return game.theme.themeColor
    }
    
    var themeName: String {
        return game.theme.name
    }
    
    var score: Int {
        return game.score
    }
        
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }

	func resetGame() {
    	game = EmojiMemoryGame.createMemoryGame()
	}
}
