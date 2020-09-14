//
//  Cardify.swift
//  MyEmojiFlipGame
//
//  Created by Kevin Huang on 2020-09-13.
//  Copyright © 2020 Chengjie Huang. All rights reserved.
//
import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double // Degree of Rotation
    
    var isFaceUp: Bool { // isFaceUp is determined from degree
        rotation < 90
    }
    
    var animatableData: Double {
        get {return rotation}
        set {rotation = newValue}
    }
    
    init (isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    // takes any displacable content (e.g. String) and converts it to a View.
    func body (content: Content)-> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth) // stroke is a function call
                content
            }
                .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRadius).fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify (isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

