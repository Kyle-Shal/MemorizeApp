//
//  EmojiMemoryGame.swift
//  Stanford Lesson01-Memorize app
//
//  Created by Kyle Shal on 2021-02-25.
// This is the ViewModel

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    private static func createMemoryGame() ->MemoryGame<String> {
        let emojis = ["👻","🎃","🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
            
        }
    }
    
    //MARK: -Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
        
    }
    
}
