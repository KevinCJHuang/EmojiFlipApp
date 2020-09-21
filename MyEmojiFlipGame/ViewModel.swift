//
//  ViewModel.swift
//  MyEmojiFlipGame
//
//  Created by Kevin Huang on 2020-09-12.
//  Copyright © 2020 Chengjie Huang. All rights reserved.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private var model: Model<String> = ViewModel.createModel()
    
    static func createModel() -> Model<String> {
        let emojis: Array<String> = ["⚽️","🏀","🏈","⚾️","🎾","🏐",/*"🏉",*/"🎱","🏓","🪀"]
        return Model<String> (numberOfPairs: emojis.count) { i in
            return emojis [i]
        }
    }
    
    // MARK: - Getter for cards
    var cards: Array<Model<String>.Card> {
        return model.cards
    }
    
    func choose (card: Model<String>.Card) {
        return model.choose(card:card)
    }
    
    func resetGame() {
        model = ViewModel.createModel()
    }
    
}

