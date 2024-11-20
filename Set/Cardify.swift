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
    
    static let cornerRadiusFactor: CGFloat = 0.08
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            let cornerRadius = geometry.size.width * Cardify.cornerRadiusFactor
            let body = RoundedRectangle(cornerRadius: cornerRadius)
            content
                .mask(body)
                .background(body.foregroundColor(.white))
                .overlay {
                    if isSelected {
                        let outlineColor: Color = matchStatus == .undetermined ? .blue : matchStatus == .matched ? .green : .red
                        body.stroke(outlineColor, lineWidth: lineWidth)
                    }
                }
        }
    }
}

extension View {
    func cardify(isSelected: Bool, matchStatus: SetGame.MatchStatus, lineWidth: CGFloat) -> some View {
        modifier(Cardify(isSelected: isSelected, matchStatus: matchStatus, lineWidth: lineWidth))
    }
}

#Preview {
    HStack {
        RoundedRectangle(cornerRadius: 10)
            .fill(.red)
            .cardify(isSelected: false, matchStatus: SetGame.MatchStatus.undetermined, lineWidth: 2)
            .aspectRatio(3/5, contentMode: .fit)
            .padding()
        RoundedRectangle(cornerRadius: 10)
            .fill(.gray)
            .cardify(isSelected: true, matchStatus: SetGame.MatchStatus.undetermined, lineWidth: 5)
            .aspectRatio(3/5, contentMode: .fit)
            .padding()
    }
}
