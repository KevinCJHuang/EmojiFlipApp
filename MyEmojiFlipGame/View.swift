//
//  ContentView.swift
//  MyEmojiFlipGame
//
//  Created by Kevin Huang on 2020-09-12.
//  Copyright © 2020 Chengjie Huang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        return Grid (items: viewModel.cards) { card in
            return CardView (card: card).onTapGesture{
                self.viewModel.choose(card:card)
            }
            .padding(5)
        }
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: Model<String>.Card
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: self.cornerRadiusConst).fill(Color.white)
                    RoundedRectangle(cornerRadius: self.cornerRadiusConst).stroke(lineWidth: self.edgeLineWidth) // stroke is a function call
                    Text(self.card.content)
                } else {
                    RoundedRectangle(cornerRadius: self.cornerRadiusConst).fill()
                }
            }
            .font(Font.system(size: self.fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Constants

    let cornerRadiusConst: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel:ViewModel())
    }
}
