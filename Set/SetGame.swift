//
//  SetGame.swift
//  Set
//
//  Created by Hannes Richter on 20.11.24.
//

/// #Model

import Foundation

struct SetGame {
    var cardsInDeck: [Card] = []
    var cardsOnBoard: [Card] = []
    
    init() {
        for color in CardProperty.all {
            for amount in CardProperty.all {
                for shape in CardProperty.all {
                    for shading in CardProperty.all {
                        cardsInDeck += [Card(
                            color: color,
                            amount: amount,
                            shape: shape,
                            shading: shading,
                            id: "\(color)\(amount)\(shape)\(shading)"
                        )]
                    }
                }
            }
        }
    }
    
    func select(_ card: Card) {
        
    }
    
    func deal3Cards() {
        
    }
    
    struct Card: Identifiable, Equatable, CustomDebugStringConvertible {
        let color: CardProperty
        let amount: CardProperty
        let shape: CardProperty
        let shading: CardProperty
        
        let id: String
        var debugDescription: String { return id }
    }
    
    enum CardProperty {
        case a
        case b
        case c
        
        static let all = [CardProperty.a, CardProperty.b, CardProperty.c]
    }
}
