//
//  EmojiTheme.swift
//  Memorize
//
//  Created by Desmarais, Jacque on 6/22/20.
//  Copyright © 2020 Desmarais, Jax. All rights reserved.
//

import SwiftUI

struct EmojiTheme {
    let name: String
    let emojiCollection: [String]
    let numberOfCards: Int?
    let themeColor: Color
}

let themes = [halloween, animals, holiday, faces, food, flags]

let halloween = EmojiTheme(name: "Halloween", emojiCollection: ["👻","🎃","🕷","😈","🍭","💀","🧠"], numberOfCards: 5, themeColor: .orange)

let animals = EmojiTheme(name: "Animals", emojiCollection: ["🐶","🐱","🐭","🐹","🐰","🦊","🐼","🐨","🐯","🦁","🐮","🐸","🐵","🐤"], numberOfCards: nil, themeColor: .pink)

let holiday = EmojiTheme(name: "Holidays", emojiCollection: ["🌲","🎃","🐰","🍾","🎆","🏮"], numberOfCards: 3, themeColor: .red)

let faces = EmojiTheme(name: "Faces", emojiCollection: ["😀","😅","😍","😘","😝","🤪","😎","😡","😳","🥶","🤢"], numberOfCards: 7, themeColor: .yellow)

let food = EmojiTheme(name: "Food", emojiCollection: ["🍕","🌮","🍔","🍜","🍦","🧁","🍣"], numberOfCards: nil, themeColor: .blue)

let flags = EmojiTheme(name: "Flags", emojiCollection: ["🏳️‍🌈","🇯🇵","🇮🇪","🇵🇱","🇺🇾"], numberOfCards: 4, themeColor: .green)
