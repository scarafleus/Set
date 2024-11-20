//
//  Diamond.swift
//  Set
//
//  Created by Hannes Richter on 21.11.24.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.midX, y: rect.minY)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        let left = CGPoint(x: rect.minX, y: rect.midY)
        
        var path = Path()
        path.move(to: top)
        path.addLine(to: right)
        path.addLine(to: bottom)
        path.addLine(to: left)
        path.addLine(to: top)
        return path
    }
}
