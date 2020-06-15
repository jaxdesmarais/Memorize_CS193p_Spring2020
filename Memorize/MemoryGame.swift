//
//  MemoryGame.swift
//  Memorize
//
//  Created by Desmarais, Jacque on 6/1/20.
//  Copyright © 2020 Desmarais, Jax. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == of.id {
                return index
            }
        }
        return 0 // TODO: bogus
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMattched: Bool = false
        var content: CardContent
        var id: Int
    }
}
