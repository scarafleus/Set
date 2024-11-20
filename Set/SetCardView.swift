//
//  SetCardView.swift
//  Set
//
//  Created by Hannes Richter on 20.11.24.
//

import SwiftUI

struct SetCardView: View {
    let card: SetGame.Card
    let matchStatus: SetGame.MatchStatus
    
    var body: some View {
        GeometryReader { geometry in
            let outlineWidth = geometry.size.width * Constants.outlineFactor
            symbols(size: geometry.size)
                .cardify(
                    isSelected: card.isSelected,
                    matchStatus: matchStatus,
                    lineWidth: outlineWidth
                )
        }
        .padding(Constants.cardInset)
    }
    
    private var amount: Int {
        switch card.amount {
        case .a: return 1
        case .b: return 2
        case .c: return 3
        }
    }
    
    @ViewBuilder
    private func symbols(size: CGSize) -> some View {
        let spacing = size.width * Constants.Symbols.spacingFactor
        let inset = size.width * Constants.cardEdge
        VStack(spacing: spacing) {
            ForEach(0..<amount, id: \.self) { index in
                symbol.aspectRatio(Constants.Symbols.aspectRatio, contentMode: .fit)
            }
        }
        .padding(inset)
        .frame(width: size.width, height: size.height, alignment: .center)
    }
    
    @ViewBuilder
    private var symbol: some View {
        switch card.shape {
        case .a:
            applyShading(toShape: Diamond())
        case .b:
            applyShading(toShape: Capsule())
        case .c:
            applyShading(toShape: Squiggle())
        }
    }
    
    private func applyShading(toShape shape: some Shape) -> some View {
        ZStack {
            shape.fill(color).opacity(opacity)
            shape.stroke(color, lineWidth: Constants.lineWidth)
        }
    }
    
    private var opacity: CGFloat {
        switch card.shading {
        case .a: return 0
        case .b: return Constants.shadingOpacity
        case .c: return 1
        }
    }
    
    private var color: Color {
        switch card.color {
        case .a: return Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        case .b: return Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
        case .c: return Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
    }
    
    private struct Constants {
        static let shadingOpacity: CGFloat = 0.3
        static let lineWidth: CGFloat = 2
        static let cardEdge: CGFloat = 0.15
        static let outlineFactor: CGFloat = 0.04
        static let cardInset: CGFloat = 4
        struct Symbols {
            static let aspectRatio: CGFloat = 2
            static let spacingFactor: CGFloat = 0.12
        }
    }
}

#Preview {
    HStack {
        SetCardView(card: SetGame.Card(color: .a, amount: .b, shape: .c, shading: .c, id: "unique1"), matchStatus: .undetermined)
            .aspectRatio(3/5, contentMode: .fit)
        SetCardView(card: SetGame.Card(color: .a, amount: .a, shape: .a, shading: .a, isSelected: true, id: "unique1"), matchStatus: .undetermined)
            .aspectRatio(3/5, contentMode: .fit)
        SetCardView(card: SetGame.Card(color: .b, amount: .b, shape: .b, shading: .b, isSelected: true, id: "unique2"), matchStatus: .mismatched)
            .aspectRatio(3/5, contentMode: .fit)
        SetCardView(card: SetGame.Card(color: .c, amount: .c, shape: .c, shading: .c, isSelected: true, id: "unique3"), matchStatus: .matched)
            .aspectRatio(3/5, contentMode: .fit)
    }
    .padding()
}
