//
//  SetCardGame.swift
//  Set
//
//  Created by Hannes Richter on 20.11.24.
//

/// #ViewModel

import SwiftUI

class SetCardGame: ObservableObject {
    @Published private var game = SetGame()
    
    var amountOfCardsInDeck: Int {
        return game.deck.count
    }
    
    var visibleCards: [SetGame.Card] {
        return game.drawnCards
    }
    
    var matchStatus: SetGame.MatchStatus {
        return game.matchStatus
    }
    
    // MARK: - Intents
    
    func newGame() {
        game = SetGame()
    }
    
    func select(_ card: SetGame.Card) {
        game.select(card)
    }
    
    func deal3Cards() {
        game.deal3Cards()
    }
}
