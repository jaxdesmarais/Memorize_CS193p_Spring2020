//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Desmarais, Jacque on 6/1/20.
//  Copyright © 2020 Desmarais, Jax. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var collectionOfCards: EmojiMemoryGame
        
    var body: some View {
        NavigationView {
            VStack {
            	Grid(collectionOfCards.cards) { card in
            		CardView(card: card).onTapGesture {
                    	self.collectionOfCards.choose(card: card)
                	}
        			.padding(5)
            	}
            	.padding()
            	.foregroundColor(collectionOfCards.color)
            	.navigationBarTitle("")
                .navigationBarItems(leading:
                    Text("\(collectionOfCards.themeName) Edition").font(.title).bold().padding(.top, 2),
                    trailing: Button(action: self.collectionOfCards.resetGame) {
            			Text("New Game")
                		.foregroundColor(.black)
                		.font(.subheadline)
                		.padding()
                		.border(Color.black, width: 4)
                })
                Text("Score \(self.collectionOfCards.score)")
                	.bold()
                    .foregroundColor(self.collectionOfCards.color)
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
        ZStack {
            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                .padding(5).opacity(0.4)
            Text(card.content)
                 .font(Font.system(size: fontSize(for: size)))
        	}
        	.cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing Constants
    private let fontScaleFactor: CGFloat = 0.675
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        let game = EmojiMemoryGame()
//        game.choose(card: game.cards[0])
//        return EmojiMemoryGameView(collectionOfCards: game)
//    }
//}
