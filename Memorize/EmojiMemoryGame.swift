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
        let emojis: Array<String> = ["👻","🎃","🕷","🍕","🌯"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojis.count)) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
