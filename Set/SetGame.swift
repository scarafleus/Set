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
        cardsInDeck.shuffle()
        deal3Cards()
        deal3Cards()
    }
    
    func select(_ card: Card) {
        
    }
    
    mutating func deal3Cards() {
        for _ in 0..<3 {
            let card = cardsInDeck.popLast()
            if let poppedCard = card {
                cardsOnBoard += [poppedCard]
            }
        }
    }
    
    struct Card: Identifiable, Equatable, CustomDebugStringConvertible {
        let color: CardProperty
        let amount: CardProperty
        let shape: CardProperty
        let shading: CardProperty
        var isSelected = false
        
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
