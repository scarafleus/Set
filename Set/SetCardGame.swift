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
        return game.cardsInDeck.count
    }
    
    var cardsOnBoard: [SetGame.Card] {
        return game.cardsOnBoard
    }
    
    // MARK: - Intents
    
    func select(_ card: SetGame.Card) {
        game.select(card)
    }
    
    func deal3Cards() {
        game.deal3Cards()
    }
}
