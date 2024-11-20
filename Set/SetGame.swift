//
//  SetGame.swift
//  Set
//
//  Created by Hannes Richter on 20.11.24.
//

/// #Model

import Foundation

struct SetGame {
    var deck: [Card] = []
    var drawnCards: [Card] = []
    var selectedCards: [Card] { drawnCards.filter { $0.isSelected } }
    var selectedCardIndices: [Int] { drawnCards.indices.filter { drawnCards[$0].isSelected } }
    var matchStatus: MatchStatus = .undetermined
    
    init() {
        for color in CardProperty.all {
            for amount in CardProperty.all {
                for shape in CardProperty.all {
                    for shading in CardProperty.all {
                        deck += [Card(
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
        deck.shuffle()
        for _ in 0...3 {
            deal3Cards()
        }
    }
    
    mutating func select(_ card: Card) {
        actOnSelection(drawIfMatched: true)
        if let chosenIndex = drawnCards.firstIndex(where: { $0.id == card.id }) {
            drawnCards[chosenIndex].isSelected.toggle()
            setSelectionMatchStatus()
        }
    }
    
    private mutating func actOnSelection(drawIfMatched: Bool) {
        switch matchStatus {
        case .matched:
            removeSelectionFromPlay()
            if (drawIfMatched) { deal3Cards() }
        case .mismatched:
            unselectAll()
        default:
            break
        }
        setSelectionMatchStatus()
    }
    
    private mutating func removeSelectionFromPlay() {
        let selectedCards = selectedCards
        drawnCards.removeAll { card in selectedCards.contains(card) }
    }
    
    private mutating func unselectAll() {
        selectedCardIndices.forEach { drawnCards[$0].isSelected = false }
    }
    
    private mutating func setSelectionMatchStatus() {
        if selectedCards.count == 3 {
            matchStatus = SetGame.threeCardsMatch(
                card1: selectedCards[0],
                card2: selectedCards[1],
                card3: selectedCards[2]
            ) ? .matched : .mismatched
        } else {
            matchStatus = .undetermined
        }
    }
    
    private static func threeCardsMatch(card1: Card, card2: Card, card3: Card) -> Bool {
        return CardProperty.allEqualOrDifferent(card1.color, card2.color, card3.color)
            && CardProperty.allEqualOrDifferent(card1.amount, card2.amount, card3.amount)
            && CardProperty.allEqualOrDifferent(card1.shape, card2.shape, card3.shape)
            && CardProperty.allEqualOrDifferent(card1.shading, card2.shading, card3.shading)
    }
    
    mutating func deal3Cards() {
        actOnSelection(drawIfMatched: false)
        for _ in 0..<3 {
            let card = deck.popLast()
            if let poppedCard = card {
                drawnCards += [poppedCard]
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
        static func allEqualOrDifferent(
            _ property1: CardProperty,
            _ property2: CardProperty,
            _ property3: CardProperty
        ) -> Bool {
            let allEqual = property1 == property2 && property2 == property3
            let allDifferent =
                property1 != property2
                && property2 != property3
                && property3 != property1
            return allEqual || allDifferent
        }
    }
    
    enum MatchStatus {
        case undetermined
        case matched
        case mismatched
    }
}
