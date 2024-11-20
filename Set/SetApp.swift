//
//  SetApp.swift
//  Set
//
//  Created by Hannes Richter on 20.11.24.
//

import SwiftUI

@main
struct SetApp: App {
    var body: some Scene {
        WindowGroup {
            SetCardGameView(setCardGame: SetCardGame())
        }
    }
}
