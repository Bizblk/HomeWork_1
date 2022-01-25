//
//  EmojiMemoryGame.swift
//  HomeWork_1
//
//  Created by Виталий Оранский on 23.01.2022.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"]
    
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String> (numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
   @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func chose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
