//
//  SetCardGameView.swift
//  Set
//
//  Created by Hannes Richter on 20.11.24.
//

/// #View

import SwiftUI

struct SetCardGameView: View {
    @ObservedObject var setCardGame: SetCardGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            AspectVGrid(items: setCardGame.visibleCards, aspectRatio: aspectRatio) { card in
                SetCardView(card: card, matchStatus: setCardGame.matchStatus)
                    .onTapGesture {
                        setCardGame.select(card)
                    }
            }
            Spacer()
            controlBar
        }
        .padding()
    }
    
    private var controlBar: some View {
        HStack {
            newGameButton
            Spacer()
            dealCardsButton
        }
    }
    
    private var newGameButton: some View {
        Button("New game") {
            setCardGame.newGame()
        }
    }
    
    @ViewBuilder
    private var dealCardsButton: some View {
        let cardsLeft = setCardGame.amountOfCardsInDeck
        Button(cardsLeft > 0 ? "\(cardsLeft) cards left" : "Deck is empty") {
            setCardGame.deal3Cards()
        }
        .disabled(cardsLeft == 0)
    }
}

#Preview {
    SetCardGameView(setCardGame: SetCardGame())
}
