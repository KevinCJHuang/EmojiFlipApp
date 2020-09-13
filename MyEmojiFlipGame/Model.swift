//
//  Model.swift
//  MyEmojiFlipGame
//
//  Created by Kevin Huang on 2020-09-12.
//  Copyright © 2020 Chengjie Huang. All rights reserved.
//

import Foundation

struct Model<CardContent> where CardContent: Equatable{
    var cards : Array <Card>
    
    var firstFaceUpCard: Int?
    
    // Intent Function

    mutating func choose (card: Card) {
        if let chosenIndex = cards.findIndex(lookingFor:card),
        !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if firstFaceUpCard != nil { // two cards are chosen
                if cards[firstFaceUpCard!].content == cards[chosenIndex].content {
                    cards[firstFaceUpCard!].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
                firstFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                firstFaceUpCard = chosenIndex
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    init(numberOfPairs: Int, cardContentFactory:(Int)->CardContent) {
        cards = Array<Card>()
        for i in 0..<numberOfPairs {
            let curCont = cardContentFactory (i)
            cards.append(Card(content: curCont,id: i*2))
            cards.append(Card(content: curCont,id: i*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false;
        var isMatched: Bool = false;
        var content: CardContent
        var id: Int
    }
}

