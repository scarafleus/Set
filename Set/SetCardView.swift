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
        ZStack {
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                if card.isSelected {
                    let outlineWidth = geometry.size.width * 0.04
                    let outlineColor: Color = matchStatus == .undetermined ? .blue : matchStatus == .matched ? .green : .red
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(outlineColor, lineWidth: outlineWidth)
                }
                symbols(size: geometry.size)
            }
        }
        .padding(4)
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
        let spacing = size.width / 8
        VStack(spacing: spacing) {
            ForEach(0..<amount, id: \.self) { index in
                symbol.aspectRatio(1, contentMode: .fit)
            }
        }
        .padding(spacing)
        .frame(width: size.width, height: size.height, alignment: .center)
    }
    
    @ViewBuilder
    private var symbol: some View {
        switch card.shape {
        case .a:
            applyShading(toShape: RoundedRectangle(cornerRadius: 5))
        case .b:
            applyShading(toShape: Circle())
        case .c:
            applyShading(toShape: RoundedRectangle(cornerRadius: 5))
        }
    }
    
    private func applyShading(toShape shape: some Shape) -> some View {
        ZStack {
            shape.fill(color).opacity(opacity)
            shape.stroke(color, lineWidth: 2)
        }
    }
    
    private var opacity: CGFloat {
        switch card.shading {
        case .a: return 0
        case .b: return 0.3
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
}

#Preview {
    HStack {
        SetCardView(card: SetGame.Card(color: .a, amount: .a, shape: .a, shading: .a, id: "unique1"), matchStatus: .undetermined)
            .aspectRatio(2/3, contentMode: .fit)
        SetCardView(card: SetGame.Card(color: .b, amount: .b, shape: .b, shading: .b, isSelected: true, id: "unique2"), matchStatus: .mismatched)
            .aspectRatio(2/3, contentMode: .fit)
        SetCardView(card: SetGame.Card(color: .c, amount: .c, shape: .c, shading: .c, id: "unique3"), matchStatus: .matched)
            .aspectRatio(2/3, contentMode: .fit)
    }
}
