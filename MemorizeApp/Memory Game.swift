//
//  Memory Game.swift
//  Stanford Lesson01-Memorize app
//
//  Created by Kyle Shal on 2021-02-25.
// This is the model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    var indexOfTheOneAndOnlyOne: Int?{
        get{ //cards.indices.filter { cards[$0].isFaceUp}.only} // Equivalent to the following 11 lines of code
            var faceUpCardIndices = [Int]()
            for index in cards.indices{
                if cards[index].isFaceUp{
                    faceUpCardIndices.append(index)
                }
            }
            if faceUpCardIndices.count == 1{
                return faceUpCardIndices.first      //equivalent to faceUpCardIndices[0]
            }else{
                return nil
            }
        }
        set{
            for index in cards.indices{
                //cards[index].isFaceUp = index == newValue  // this is one line of code that is equivalent to the following 5 for minimalistic code
                if index == newValue {
                    cards[index].isFaceUp = true
                }else{
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    
    mutating func choose (card: Card) {
        print("card chosen: \(card)")
        //var to store the index of the chosen card in the array from the func
        //only going to touch on cards that are facedown and not matched
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyOne {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true

            }else{
                indexOfTheOneAndOnlyOne = chosenIndex
            }
        }
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}


