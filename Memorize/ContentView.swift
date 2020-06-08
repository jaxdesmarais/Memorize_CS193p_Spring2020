//
//  ContentView.swift
//  Memorize
//
//  Created by Desmarais, Jacque on 6/1/20.
//  Copyright © 2020 Desmarais, Jax. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var collectionOfCards: EmojiMemoryGame
    
    var body: some View {
        return HStack {
            ForEach(collectionOfCards.cards) { card in
                CardView(card: card).onTapGesture{
                    self.collectionOfCards.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
        	.font(collectionOfCards.cards.count > 8 ? Font.title : Font.largeTitle)
        	.aspectRatio(2/3, contentMode: .fit)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
            RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
            RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(collectionOfCards: EmojiMemoryGame())
    }
}
