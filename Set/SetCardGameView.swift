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
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        AspectVGrid(items: setCardGame., aspectRatio: <#T##CGFloat#>, content: <#T##(Identifiable) -> View#>)
    }
}

#Preview {
    SetCardGameView(setCardGame: SetCardGame())
}

struct SetCardView: View {
    let card: SetGame.Card
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
