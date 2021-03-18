//
//  Memory Game.swift
//  Stanford Lesson01-Memorize app
//
//  Created by Kyle Shal on 2021-02-25.
// This is the model

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose (card: Card) {
        print("card chosen: \(card)")
        //var to store the index of the chosen card in the array from the func
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    // func used to locate the index of the chosen card in the array
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id{
                return index
            }
        }
        return 0 //TODO: bogus!
    }
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) ->CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = true
        var content: CardContent
        var id: Int
    }
}


