//
//  Cardify.swift
//  Memorize
//
//  Created by Hannes Richter on 20.11.24.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isSelected: Bool
    let matchStatus: SetGame.MatchStatus
    let lineWidth: CGFloat
    
    static let cornerRadius: CGFloat = 12
    
    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: Cardify.cornerRadius)
                    .foregroundColor(.white)
            }
            .overlay {
                if isSelected {
                    let outlineColor: Color = matchStatus == .undetermined ? .blue : matchStatus == .matched ? .green : .red
                    RoundedRectangle(cornerRadius: Cardify.cornerRadius)
                        .stroke(outlineColor, lineWidth: lineWidth)
                }
            }
    }
}

extension View {
    func cardify(isSelected: Bool, matchStatus: SetGame.MatchStatus, lineWidth: CGFloat) -> some View {
        modifier(Cardify(isSelected: isSelected, matchStatus: matchStatus, lineWidth: lineWidth))
    }
}
