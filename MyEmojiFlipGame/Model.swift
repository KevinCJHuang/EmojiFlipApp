//
//  Model.swift
//  MyEmojiFlipGame
//
//  Created by Kevin Huang on 2020-09-12.
//  Copyright © 2020 Chengjie Huang. All rights reserved.
//

import Foundation

struct Model<CardContent> {
    var cards : Array <Card>
    
    mutating func choose (card: Card) {
        print ("card chosen: \(card)")
        let chosenIndex: Int = cards.findIndex(lookingFor:card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    init(numberOfPairs: Int, cardContentFactory:(Int)->CardContent) {
        cards = Array<Card>()
        for i in 0..<numberOfPairs {
            let curCont = cardContentFactory (i)
            cards.append(Card(content: curCont,id: i*2))
            cards.append(Card(content: curCont,id: i*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true;
        var isMatched: Bool = false;
        var content: CardContent
        var id: Int
    }
}

