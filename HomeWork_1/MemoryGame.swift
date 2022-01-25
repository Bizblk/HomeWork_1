//
//  Model.swift
//  HomeWork_1
//
//  Created by Виталий Оранский on 23.01.2022.
//

import Foundation


struct MemoryGame <CardContent> where CardContent: Equatable {
    
    private (set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
   mutating func choose(_ card: Card) {
       if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
          !cards[chosenIndex].isFaceUp,
          !cards[chosenIndex].isMatched {
           if let potantialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
               if cards[chosenIndex].content == cards[potantialMatchIndex].content {
                   cards[chosenIndex].isMatched = true
                   cards[potantialMatchIndex].isMatched = true
               }
               indexOfTheOneAndOnlyFaceUpCard = nil
           } else {
               for index in cards.indices {
                   cards[index].isFaceUp = false
               }
               indexOfTheOneAndOnlyFaceUpCard = chosenIndex
           }
           cards[chosenIndex].isFaceUp.toggle()
       }
        print(cards)
    }
    
    init (numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card> ()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))

        }
    }
    
    
    struct Card: Identifiable {
        
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}





