//
//  Extensions.swift
//  Memorize
//
//  Created by Hannes Richter on 19.11.24.
//

import SwiftUI

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

extension CGRect {
    var midPoint: CGPoint {
        CGPoint(x: midX, y: midY)
    }
}
