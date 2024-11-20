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
    
    private let aspectRatio: CGFloat = 3/5
    
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
            deckCount
            Spacer()
            dealCardsButton
        }
    }
    
    private var newGameButton: some View {
        Button(action: {
            setCardGame.newGame()
        }, label: {
            Image(systemName: "arrow.clockwise")
                .font(.title)
                .padding(2)
        })
    }
    
    @ViewBuilder
    private var deckCount: some View {
        let cardsLeft = setCardGame.amountOfCardsInDeck
        Text(cardsLeft > 0 ? "\(cardsLeft) cards left" : "Deck is empty")
            .font(.title2)
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 4).fill(.gray))
    }
    
    @ViewBuilder
    private var dealCardsButton: some View {
        let cardsLeft = setCardGame.amountOfCardsInDeck
        Button(action: {
            setCardGame.deal3Cards()
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus")
                .font(.title)
                .padding(2)
        })
        .disabled(cardsLeft == 0)
    }
}

#Preview {
    SetCardGameView(setCardGame: SetCardGame())
}
