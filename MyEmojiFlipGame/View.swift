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
        VStack {
            Grid (items: viewModel.cards) { card in
                CardView (card: card).onTapGesture{
                    withAnimation(.linear(duration: 0.75)) {
                        self.viewModel.choose(card:card)
                    }
                }
                .padding(5)
            }
                .foregroundColor(Color.orange)
                .padding()
            Button (action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.viewModel.resetGame()
                }
            }, label: {Text("New Game")})
        }
    }
}

struct CardView: View {
    var card: Model<String>.Card
    @State private var animatedBonusRemaining: Double = 0

    private func startBonusTimeAnimation () {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    
    //
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder // makes the following a View; it's either a ZStack or an emptyView
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack { // stack of multiple views; a function that takes no argument
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                            .onAppear {
                                self.startBonusTimeAnimation()
                            }
                    } else {
                        Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                    }
                }
                    .padding(5).opacity(0.4)
                    .transition(.identity)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees (card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            //.modifier(Cardify(isFaceUp: card.isFaceUp))
            .cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.scale)
        }
    }
    
    // MARK: - Constants
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel:ViewModel())
    }
}
